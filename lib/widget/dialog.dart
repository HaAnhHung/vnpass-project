import 'package:flutter/material.dart';
import 'package:vnpass/theme/colors.dart';
import 'package:vnpass/widget/loading.dart';

void dialog(BuildContext context, String title, String message, Function() function, String textBtn) {
  showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                child: Text(title), style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.black),),
              const SizedBox(height: 15,),
              DefaultTextStyle(
                child: Text(message), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppTheme.black),textAlign: TextAlign.center,),
              const SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: function,
                    style: ElevatedButton.styleFrom(primary: AppTheme.greenApp2, padding: const EdgeInsets.symmetric(vertical: 15)),
                    child: Text(textBtn, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500,),),
                ),
              )
            ],
          ),
        ),
      )
  );
}