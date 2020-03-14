import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:flutter/material.dart';

formSheet(
    {BuildContext context,
    String titleName,
    String defaultValue,
    String placeholderText = '',
    void Function(String text) onEnter,
    bool shouldCloseAfterAdd = false}) {
  final inpController = TextEditingController();
  var inpText = '';
  return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)),
      builder: (BuildContext context) {
        inpController.text = defaultValue ?? '';
        inpController.selection = TextSelection.fromPosition(
          TextPosition(offset: inpController.text.length),
        );
        return Container(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    titleName,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 24.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        textInputAction: TextInputAction.go,
                        controller: inpController,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: placeholderText,
                          filled: true,
                          fillColor: choosyColors['input'],
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.7),
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
                          onPressed: () {
                            _onFormSubmit(
                              inpController,
                              onEnter,
                              inpText,
                            );
                            if (shouldCloseAfterAdd) Navigator.pop(context);
                          })
                    ],
                  )
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
