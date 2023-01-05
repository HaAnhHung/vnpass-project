class MoneyFormat {
  final String decimalSeparator;
  final String thousandSeparator;

  MoneyFormat({
    this.decimalSeparator = ',',
    this.thousandSeparator = '.',
  });

  String applyMask(double value) {
    String textRepresentation =
    value.toStringAsFixed(0).replaceAll('.', decimalSeparator);

    List<String> numberParts = [];

    for (var i = 0; i < textRepresentation.length; i++) {
      numberParts.add(textRepresentation[i]);
    }

    const lengthsWithThousandSeparators = [3, 7, 11, 15, 19];

    for (var i = 0; i < lengthsWithThousandSeparators.length; i++) {
      var l = lengthsWithThousandSeparators[i];

      if (numberParts.length > l) {
        numberParts.insert(numberParts.length - l, thousandSeparator);
      } else {
        break;
      }
    }

    String numberText = numberParts.join('');

    return numberText;
  }
}