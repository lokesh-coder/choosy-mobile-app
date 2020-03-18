import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/source/models/choice.model.dart';
import 'package:flutter/material.dart';

class ChoicesList extends StatelessWidget {
  final List<Choice> data;
  final String id;
  final Function onRemove;

  ChoicesList({Key key, this.id, this.data, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.separated(
        itemCount: data.length,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (ctx, i) => Divider(),
        itemBuilder: (BuildContext ctxt, int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              color: Colors.transparent,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                title: Container(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [Color(0xffAD548E), Color(0xffDF804A)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        tileMode: TileMode.clamp,
                      ).createShader(bounds);
                    },
                    child: Text(
                      data[index].name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    ChoosyIcon.close_circle_line,
                    color: choosyColors['heading'].withOpacity(0.5),
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
