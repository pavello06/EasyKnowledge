import 'package:easy_knowledge/core/l10n/s.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension PrettyDate on DateTime {
  String pretty(BuildContext context) =>
      DateFormat('d MMMM yyyy', S.of(context).localeName).format(this);
}
