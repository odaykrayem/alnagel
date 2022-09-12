import 'package:intl/intl.dart';

String getYeatMonth(DateTime dateToFormat) {
  String parseDate =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateToFormat);
  var inputDate = DateTime.parse(parseDate.toString());
  var outputFormat = DateFormat('yy/MM');
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

String justDate(DateTime dateToFormat) {
  String parseDate = DateFormat("yyyy-MM-dd").format(dateToFormat);
  var inputDate = DateTime.parse(parseDate.toString());
  var outputFormat = DateFormat('dd/MM/yyyy');
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

String getTime(DateTime dateToFormat) {
  String parseDate =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateToFormat);
  var inputDate = DateTime.parse(parseDate.toString());
  var outputFormat = DateFormat("hh a");
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}
