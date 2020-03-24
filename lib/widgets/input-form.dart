import 'package:coolflutterapp/config/app-config.dart';
import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/utils/toast.dart';
import 'package:coolflutterapp/widgets/form-titlebar.dart';
import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final String titleName;
  final String defaultValue;
  final String placeholderText;
  final void Function(String text) onEnter;

  InputForm({
    this.titleName,
    this.defaultValue,
    this.onEnter,
    this.placeholderText = '',
  });

  @override
  Widget build(BuildContext context) {
    final inpController = TextEditingController();
    inpController.text = defaultValue ?? '';
    inpController.selection = TextSelection.fromPosition(
      TextPosition(offset: inpController.text.length),
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(30.0),
      margin: const EdgeInsets.all(10.0),
      child: Container(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerLeft,
                child: FormTitleBar(
                  title: titleName,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: TextField(
                    textInputAction: TextInputAction.go,
                    controller: inpController,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    maxLength: appConfig['maxItemLength'],
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
                    onSubmitted: (text) {
                      _onFormSubmit(
                        inpController,
                        onEnter,
                      );
                      Navigator.pop(context);
                    },
                  )),
                  IconButton(
                      icon: Icon(ChoosyIcon.send_plane_2_fill),
                      color: choosyColors['positive'],
                      disabledColor: choosyColors['positive'].withOpacity(0.3),
                      onPressed: () {
                        if (inpController.text.trim().length == 0) {
                          Toast.error('nothing changed!');
                          return null;
                        }
                        _onFormSubmit(
                          inpController,
                          onEnter,
                        );
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onFormSubmit(
    TextEditingController inpController,
    void onEnter(String text),
  ) {
    onEnter(inpController.text);
    inpController.clear();
  }
}
