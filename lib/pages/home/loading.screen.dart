import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/widgets/app-shell.dart';
import 'package:coolflutterapp/widgets/header.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShell(
      header: Header(
        title: 'choosy',
      ),
      child: Container(
        decoration: BoxDecoration(
          color: choosyColors['bg'],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Center(
          child: Text('loading...'),
        ),
      ),
    );
  }
}
