import 'package:flutter/material.dart';
import 'package:movieverse/utils/colors.dart';

class BaseContainer extends StatelessWidget {
  final Widget child;
  const BaseContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
      color: AppColors().purple7,
      child: child,
    );
  }
}
