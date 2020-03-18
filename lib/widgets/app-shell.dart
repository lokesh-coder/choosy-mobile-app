import 'package:coolflutterapp/config/colors.dart';
import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  final Widget header;
  final Widget footer;
  const AppShell({this.child, this.header, this.footer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Color(0xffAD548E), Color(0xffDF804A)]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              header,
              Expanded(
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(footer != null ? 20 : 0),
                    bottomRight: Radius.circular(footer != null ? 20 : 0),
                  ),
                  child: Container(
                    color: choosyColors['bg'],
                    child: child,
                  ),
                ),
              ),
              if (footer != null) footer,
            ],
          ),
        ),
      ),
    );
  }
}
