import 'package:taosel_user_app/core/validation/validation.dart';
import 'package:flutter/cupertino.dart';

class FormValidator {
  static String? passwordValidate(BuildContext context, String? value) {
    final passwordValidator = Validate.validatePassword(context, value);
    if (passwordValidator == null) {
      return null;
    } else {
      return passwordValidator;
    }
  }

  static String? passwordConfirmValidate(
      BuildContext context, String? value, String? confirmValue) {
    final passwordValidator = Validate.validatePassword(context, value,
        confirmPassword: confirmValue);
    if (passwordValidator == null) {
      return null;
    } else{
      return passwordValidator;
    }
  }
/*
static String? passwordConfirmValidate(
      BuildContext context, String? value, String? confirmValue) {
    final passwordValidator = Validate.validatePassword(context, value,
        confirmPassword: confirmValue);
    if (passwordValidator == null) {
      return null;
    } if(passwordValidator.isNotEmpty||value!.length<6) {
      return passwordValidator;
    }
  }
*/
  static String? emailValidate(BuildContext context, String? value) {
    final emailValidator = Validate.validateEmail(context, value);
    if (emailValidator == null) {
      return null;
    } else {
      return emailValidator;
    }
  }

  static String? phoneValidate(BuildContext context, String? value) {
    final phoneValidator = Validate.validatePhoneNumber(context, value);
    if (phoneValidator == null) {
      return null;
    } else {
      return phoneValidator;
    }
  }
  static String? mapValidate(BuildContext context, String? value) {
    final phoneValidator = Validate.validateMap(context, value);
    if (phoneValidator == null) {
      return null;
    } else {
      return phoneValidator;
    }
  }

  static String? licenceValidate(BuildContext context, String? value) {
    final phoneValidator = Validate.validateLicenceNumber(context, value);
    if (phoneValidator == null) {
      return null;
    } else {
      return phoneValidator;
    }
  }


  static String? nameValidate(BuildContext context, String? value) {
    final nameValidator = Validate.validateName(context, value);
    if (nameValidator == null) {
      return null;
    } else {
      return nameValidator;
    }
  }

  static String? creditValidate(BuildContext context, String? value) {
    final validator = Validate.validateCreditCardNumber(context, value);
    if (validator == null) {
      return null;
    } else {
      return validator;
    }
  }

  static String? cvvValidate(BuildContext context, String? value) {
    final validator = Validate.validateCVV(context, value);
    if (validator == null) {
      return null;
    } else {
      return validator;
    }
  }

  static String? dateValidate(String? value) {
    final validator = Validate.validateDate(value);
    if (validator == null) {
      return null;
    } else {
      return validator;
    }
  }
}
