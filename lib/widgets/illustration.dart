import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Illustration extends StatelessWidget {
  final String fileName = '';
  Illustration({String fileName});

  String _getSvgFilePath() {
    return 'assets/svg/$fileName.svg';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(_getSvgFilePath(), semanticsLabel: fileName),
    );
  }
}
