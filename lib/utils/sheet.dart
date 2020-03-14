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
      builder: (BuildContext context) {
        inpController.text = defaultValue ?? '';
        inpController.selection = TextSelection.fromPosition(
          TextPosition(offset: inpController.text.length),
        );
        return Padding(
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
                        controller: inpController,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        decoration: InputDecoration(hintText: placeholderText),
                        onChanged: (text) {
                          inpText = text;
                        },
                      )),
                      IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {
                            inpController.clear();
                            onEnter(inpText);
                            inpText = '';
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
