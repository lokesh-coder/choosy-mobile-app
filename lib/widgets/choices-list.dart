import 'package:choosy/config/colors.dart';
import 'package:choosy/config/icons.dart';
import 'package:choosy/source/models/choice.model.dart';
import 'package:flutter/material.dart';

class ChoicesList extends StatelessWidget {
  final List<Choice> data;
  final String id;
  final Function onRemove;

  const ChoicesList({this.id, this.data, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.separated(
        itemCount: data.length,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (ctx, i) => Divider(),
        itemBuilder: (BuildContext ctxt, int index) {
          return TweenAnimationBuilder(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            tween: Tween<double>(begin: 40, end: 0),
            builder: (context, val, child) {
              return ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: val),
                title: Text(
                  data[index].name,
                  style: TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: <Color>[
                          choosyColors['highlightBgStart'],
                          choosyColors['highlightBgEnd'],
                        ],
                      ).createShader(
                        new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                      ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    ChoosyIcon.close_circle_line,
                    color: choosyColors['heading'].withOpacity(0.2),
                  ),
                  onPressed: () async {
                    onRemove(id, data[index]);
                  },
                ),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
