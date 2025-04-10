import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  static final DateFormat fullDateFormat = DateFormat('EEEE, dd/MM', 'pt_BR');
  static final DateFormat dateFormat = DateFormat.yMd('pt_BR');
  static final DateFormat timeFormat = DateFormat.Hm('pt_BR');

  String toFullDate() => fullDateFormat.format(this);
  String toShortDate() => dateFormat.format(this);
  String toTimeFormat() => timeFormat.format(this);

  String toDateTimeFormat() => '${dateFormat.format(this)} ${timeFormat.format(this)}';
}
