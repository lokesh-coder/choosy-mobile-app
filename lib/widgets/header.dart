import 'package:choosy/pages/about.dart';
import 'package:choosy/utils/fade-transition.dart';
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
                fontWeight: FontWeight.w600,
                letterSpacing: -1,
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
            Icons.info_outline,
            color: Colors.white.withOpacity(0.7),
          ),
          onPressed: () {
            Navigator.push(context, FadeRoute(page: AboutPage()));
          },
        )
      ],
    );
  }
}
