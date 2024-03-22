//*---------------------------------------------------------------- ( Double converter )
  String doubleAmount(String amount) {
    if (amount.isEmpty || amount == '' || amount == '.' || amount == 'null') {
      return '0.00';
    } else {
      return double.parse(amount == '.' ? '0.' : amount).toStringAsFixed(2);
    }
  }