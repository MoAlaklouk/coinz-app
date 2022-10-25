enum AlartValue { MORETHAN, LESSTHAN, EQUAL }

String alartValue(AlartValue state) {
  String value;

  switch (state) {
    case AlartValue.MORETHAN:
      value = 'اكبر من';

      break;
    case AlartValue.LESSTHAN:
      value = 'اقل من';

      break;
    case AlartValue.EQUAL:
      value = 'يساوي';

      break;
  }
  return value;
}
