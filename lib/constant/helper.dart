import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String dateFormat(DateTime value) {
  return DateFormat.yMd().format(value);
}

String dateFormat2(DateTime value) {
  initializeDateFormatting();
  var format = DateFormat.yMMMMd('ar');
  return format.format(value);
}
