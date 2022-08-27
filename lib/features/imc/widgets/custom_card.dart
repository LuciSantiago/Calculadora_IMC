// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  BorderSide? borderSide;
  final double height;
  final double width;
  final Column child;

  CustomCard({
    Key? key,
    this.borderSide,
    this.height = 190,
    this.width = 180,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            //questão de está selecionado ou não
            side: borderSide ?? BorderSide.none,
          ),
          child: child),
    );
  }
}
