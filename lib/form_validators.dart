import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

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

String? _minCharactersCount(int min, dynamic value) {

  if(value == null) return null;
  assert(value is String);
  int charCount = (value as String).length;

  if(charCount < min) return "Minimum $min characters";
  return null;
}

String? _maxCharactersCount(int max, dynamic value) {

  if(value == null) return null;
  assert(value is String);
  int charCount = (value as String).length;

  if(charCount > max) return "Minimum $max characters";
  return null;
}

class FormValidators {

  FormValidators._();

  static FormFieldValidator get Required => _required;
  static FormFieldValidator get Percentage => _percentage;
  static FormFieldValidator get PercentageUnlimited => _percentageUnlimited;
  static FormFieldValidator min(num min) => (value) => _min(min, value);
  static FormFieldValidator max(num max) => (value) => _max(max, value);
  static FormFieldValidator range(num min, num max) => (value) => FormValidation.validate(value, [
      (value) => _min(min, value),
      (value) => _max(max, value),
  ]);
  static FormFieldValidator minCharactersCount(int min) => (value) => _minCharactersCount(min, value);
  static FormFieldValidator maxCharactersCount(int max) => (value) => _maxCharactersCount(max, value);
  static FormFieldValidator charactersCountRange(int min, int max) => (value) => FormValidation.validate(value, [
        (value) => _minCharactersCount(min, value),
        (value) => _maxCharactersCount(max, value),
  ]);

}