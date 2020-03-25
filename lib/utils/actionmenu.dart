import 'package:choosy/widgets/actionmenu.dart';
import 'package:flutter/material.dart';

actionMenu({
  BuildContext context,
  String title,
  Function onDelete,
  Function onEdit,
}) {
  return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      // shape: new RoundedRectangleBorder(
      //   borderRadius: new BorderRadius.circular(10.0),
      // ),
      builder: (BuildContext context) {
        return ActionMenu(
          onDelete: onDelete,
          onEdit: onEdit,
        );
      });
}
