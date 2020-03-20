import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/utils/toast.dart';
import 'package:flutter/material.dart';

formSheet(
    {BuildContext context,
    String titleName,
    String defaultValue,
    String placeholderText = '',
    void Function(String text) onEnter}) {
  final inpController = TextEditingController();
  var inpText = '';
  return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)),
      builder: (BuildContext context) {
        inpController.text = defaultValue ?? '';
        inpController.selection = TextSelection.fromPosition(
          TextPosition(offset: inpController.text.length),
        );
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.all(30.0),
          margin: const EdgeInsets.all(10.0),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Color(0xFFAD548E),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          titleName,
                          style: TextStyle(
                              color: choosyColors['heading'],
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        textInputAction: TextInputAction.go,
                        controller: inpController,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        maxLength: 50,
                        maxLines: 1,
                        keyboardAppearance: Brightness.dark,
                        scrollPhysics: BouncingScrollPhysics(),
                        scrollPadding: EdgeInsets.all(20),
                        decoration: InputDecoration(
                          hintText: placeholderText,
                          filled: true,
                          fillColor: choosyColors['input'],
                          contentPadding: EdgeInsets.all(10),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (text) {
                          inpText = text;
                        },
                        onSubmitted: (text) {
                          _onFormSubmit(
                            inpController,
                            onEnter,
                            inpText,
                          );
                          Navigator.pop(context);
                        },
                      )),
                      IconButton(
                          icon: Icon(ChoosyIcon.send_plane_2_fill),
                          color: choosyColors['positive'],
                          disabledColor:
                              choosyColors['positive'].withOpacity(0.3),
                          onPressed: () {
                            if (inpText.trim().length == 0) {
                              Toast.error('nothing changed!');
                              return null;
                            }
                            _onFormSubmit(
                              inpController,
                              onEnter,
                              inpText,
                            );
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

void _onFormSubmit(
  TextEditingController inpController,
  void onEnter(String text),
  String inpText,
) {
  inpController.clear();
  onEnter(inpText);
  inpText = '';
}
