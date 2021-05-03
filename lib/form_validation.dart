library form_validation;

import 'package:flutter/material.dart';

class FormValidation {

  FormValidation._();

  static String? validate(dynamic value, List<FormFieldValidator<dynamic>> validators) {
    for (var validator in validators) {
      var error = validator(value);
      if(error != null)
        return error;
    }
    return null;
  }

}
