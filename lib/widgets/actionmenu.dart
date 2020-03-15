import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:flutter/material.dart';

class ActionMenu extends StatelessWidget {
  final Function onDelete;
  final Function onEdit;

  ActionMenu({this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Action',
            style: TextStyle(
                // fontFamily: 'Gilroy',
                color: choosyColors['subtitle'],
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              ChoosyIcon.edit_line,
              color: choosyColors['negative'],
            ),
            title: Text(
              'Edit the dice',
              style: TextStyle(
                  color: choosyColors['title'], fontWeight: FontWeight.w600),
            ),
            onTap: onEdit,
          ),
          ListTile(
            leading: Icon(
              ChoosyIcon.delete_bin_5_line,
              color: choosyColors['negative'],
            ),
            title: Text(
              'Delete the dice',
              style: TextStyle(
                  color: choosyColors['title'], fontWeight: FontWeight.w600),
            ),
            onTap: onDelete,
          )
        ],
      ),
    );
  }
}
