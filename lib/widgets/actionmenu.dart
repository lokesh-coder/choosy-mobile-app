import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:flutter/material.dart';

class ActionMenu extends StatefulWidget {
  final Function onDelete;
  final Function onEdit;

  ActionMenu({this.onEdit, this.onDelete});

  @override
  _ActionMenuState createState() => _ActionMenuState();
}

class _ActionMenuState extends State<ActionMenu> {
  bool deleteConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.all(10.0),
      child: Container(
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
              onTap: widget.onEdit,
            ),
            Visibility(
              visible: !deleteConfirmed,
              child: ListTile(
                leading: Icon(
                  ChoosyIcon.delete_bin_5_line,
                  color: choosyColors['negative'],
                ),
                title: Text(
                  'Delete the dice',
                  style: TextStyle(
                      color: choosyColors['title'],
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  setState(() {
                    deleteConfirmed = true;
                  });
                },
              ),
            ),
            Visibility(
              visible: deleteConfirmed,
              child: ListTile(
                leading: Icon(
                  Icons.help_outline,
                  color: choosyColors['negative'],
                ),
                title: Text(
                  'Are you sure? ',
                  style: TextStyle(
                      color: choosyColors['title'],
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.check, color: choosyColors['positive']),
                      onPressed: widget.onDelete,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.pink.shade200,
                      ),
                      onPressed: () {
                        setState(() {
                          deleteConfirmed = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
