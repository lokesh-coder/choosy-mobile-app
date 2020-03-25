import 'package:choosy/config/colors.dart';
import 'package:choosy/widgets/app-shell.dart';
import 'package:choosy/widgets/header.dart';
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
