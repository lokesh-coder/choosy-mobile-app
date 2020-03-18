import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Illustration extends StatelessWidget {
  final String fileName;
  Illustration(this.fileName);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$fileName.svg',
      semanticsLabel: fileName,
      width: 200,
    );
  }
}
