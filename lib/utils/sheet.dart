import 'package:choosy/widgets/input-form.dart';
import 'package:flutter/material.dart';

formSheet(
    {BuildContext context,
    String titleName,
    String defaultValue,
    String placeholderText = '',
    void Function(String text) onEnter}) {
  return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)),
      builder: (BuildContext context) {
        return InputForm(
          titleName: titleName,
          defaultValue: defaultValue,
          placeholderText: placeholderText,
          onEnter: onEnter,
        );
      });
}
