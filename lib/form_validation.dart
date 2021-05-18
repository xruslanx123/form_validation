library form_validation;

import 'package:flutter/material.dart';

export 'package:form_validation/form_validators.dart';

class FormValidation {

  FormValidation._();

  static bool printErrors = false;

  static String? validate(dynamic value, List<FormFieldValidator<dynamic>> validators) {
    for (var validator in validators) {
      var error = validator(value);
      if(error != null) {
        if(printErrors)
          print(error);
        return error;
      }
    }
    return null;
  }

}
