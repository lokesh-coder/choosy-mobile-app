import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:flutter/material.dart';

class ChoicesList extends StatelessWidget {
  final List data;
  final String id;
  final Function onRemove;

  ChoicesList({Key key, this.id, this.data, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              color: choosyColors['tile'],
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                leading: Text(
                  '${(index + 1)}'.padLeft(2, '0'),
                  style: TextStyle(
                    color: choosyColors['primary'].withOpacity(0.6),
                    fontSize: 23,
                  ),
                ),
                title: Text(
                  data[index]['name'],
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: choosyColors['heading']),
                ),
                trailing: IconButton(
                  icon: Icon(
                    ChoosyIcon.close_circle_line,
                    color: choosyColors['negative'],
                  ),
                  onPressed: () async {
                    onRemove(id, data[index]);
                  },
                ),
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
