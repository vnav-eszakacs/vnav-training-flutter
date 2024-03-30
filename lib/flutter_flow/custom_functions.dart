import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

DateTime? createDateTimeFromArray(List<dynamic> dateArray) {
  if (dateArray.length < 3) {
    return null;
  }

  int year = dateArray[0];
  int month = dateArray.length > 1
      ? dateArray[1]
      : 1; // Default month is January if not provided
  int day = dateArray.length > 2
      ? dateArray[2]
      : 1; // Default day is 1 if not provided
  int hour = dateArray.length > 3
      ? dateArray[3]
      : 0; // Default hour is 0 if not provided
  int minute = dateArray.length > 4
      ? dateArray[4]
      : 0; // Default minute is 0 if not provided
  int second = dateArray.length > 5
      ? dateArray[5]
      : 0; // Default second is 0 if not provided

  return DateTime(year, month, day, hour, minute, second);
}

DateTime? createDateFromInt(int? intDate) {
  if (intDate == null) return null;
  final date = DateTime.fromMillisecondsSinceEpoch(intDate);
  return date;
}
