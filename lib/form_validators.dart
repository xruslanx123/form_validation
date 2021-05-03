import 'package:flutter/material.dart';

String? _required(dynamic value) {
  print('$value: ${value.runtimeType}');
  if(value == null) return "Required";
  print('not null');
  if(value is String && value.isEmpty) return "Required";
  print('String not empty');
  return null;
}

String? _percentage(dynamic value) {
  if(value == null) return null;

  int percentage;
  if(value is String) percentage = int.parse(value);
  else if(value is double) percentage = (value * 100).toInt();
  else if(value is int) percentage = value;
  else return "Invalid value";

  if(percentage < 0 || percentage > 100) return "Out of range (0...100)";
  return null;
}

String? _percentageUnlimited(dynamic value) {
  if(value == null) return null;

  int percentage;
  if(value is String) percentage = int.parse(value);
  else if(value is double) percentage = (value * 100).toInt();
  else if(value is int) percentage = value;
  else return "Invalid value";

  if(percentage < 0) return "Out of range (0...100)";
  return null;
}

String? _min(num min, dynamic value) {
  if(value == null) return null;
  num number = value is num ? value : num.parse(value);
  if(number < min) return "Cannot be below $min";
  return null;
}

String? _max(num max, dynamic value) {
  if(value == null) return null;
  num number = value is num ? value : num.parse(value);
  if(number < max) return "Cannot be above $max";
  return null;
}

class FormValidators {

  FormValidators._();

  static FormFieldValidator get Required => _required;
  static FormFieldValidator get Percentage => _percentage;
  static FormFieldValidator get PercentageUnlimited => _percentageUnlimited;
  static FormFieldValidator min(min) => (value) => _min(min, value);
  static FormFieldValidator max(max) => (value) => _max(max, value);

}