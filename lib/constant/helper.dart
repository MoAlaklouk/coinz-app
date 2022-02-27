import 'package:intl/intl.dart';

String dateFormat(DateTime value) {
  return DateFormat.yMd().format(value);
}
