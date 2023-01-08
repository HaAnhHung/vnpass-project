import 'package:flutter/material.dart';
import 'package:vnpass/theme/colors.dart';

class Loading extends StatelessWidget{
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      color: AppTheme.white,
    );
  }

}