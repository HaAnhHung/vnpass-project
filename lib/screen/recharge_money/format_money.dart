import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

String formatMoney(String value, TextEditingController textEditingController) {
  String newValue = value.replaceAll(',', '').replaceAll('.', '').replaceAll(' ', '');
  if (value.isEmpty || newValue == '00') {
    textEditingController.clear();
    return "0";
  }

  int value1 = int.parse(newValue);
  value = NumberFormat.currency(customPattern: '###,###', locale: 'vi_VN').format(value1);

  textEditingController.value = TextEditingValue(
    text: value,
    selection: TextSelection.collapsed(offset: value.length),
  );
  return newValue;
}