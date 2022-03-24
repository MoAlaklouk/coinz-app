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

numFormat(number) {
  var f = NumberFormat("###.0#");
  return f.format(number);
}

int coinzPageNum = 1;
int coinzPageCount = 20;
int newsPageNum = 1;
int newsPageCount = 7;
