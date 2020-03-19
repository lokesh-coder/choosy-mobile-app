import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/utils/toast.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final dynamic title;
  final Widget leading;
  final Widget action;

  const Header({this.title, this.action, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (title is Widget)
          ? title
          : Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w900,
                fontFamily: 'Gilroy',
              ),
            ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: leading,
      actions: <Widget>[
        if (action != null) action,
        IconButton(
          icon: Icon(
            ChoosyIcon.settings_3_line,
            color: Colors.white.withOpacity(0.7),
          ),
          onPressed: () {
            Toast.success('hiya you are awesome');
          },
        )
      ],
    );
  }
}
