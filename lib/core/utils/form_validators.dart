import 'package:lupus_app/core/utils/app_regex.dart';

abstract class FormValidators {
  static String? customTextFormFieldValidator(String? value) {
    if (isValueEmpty(value)) return 'This field is required';
    return null;
  }

  static String? emailValidator(String? value) {
    if (isValueEmpty(value)) return 'This field is required';
    if (!AppRegex.isValidEmail(value!)) return 'Invalid email address';
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 6) return 'Password must be at least 6 characters long';
    if (!AppRegex.hasLowerCase(value)) return 'Password must contain at least one lowercase letter';
    if (!AppRegex.hasUpperCase(value)) return 'Password must contain at least one uppercase letter';
    if (!AppRegex.hasNumber(value)) return 'Password must contain at least one number';
    if (!AppRegex.hasSpecialCharacter(value)) return 'Password must contain at least one special character';
    return null;
  }

  static String? binCodeTextFormFieldValidator(String? value) {
    if (isValueEmpty(value) || value!.length < 4) return 'Please enter the correct code';
    return null;
  }

  static String? validateName(String? value) {
    if (isValueEmpty(value)) return 'Please enter your name';
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (isValueEmpty(value)) return 'Please enter your phone number';
    if (!AppRegex.isPhoneNumberValid(value!)) return 'Please enter a valid phone number';
    return null;
  }

  static String? validateAddress(String? value) {
    if (isValueEmpty(value)) return 'Please enter your address';
    return null;
  }

  static bool isValueEmpty(String? value) {
    if (value == null || value.trim().isEmpty) return true;
    return false;
  }
}


abstract class FormValidatorsAr {
  static String? customTextFormFieldValidator(String? value) {
    if (isValueEmpty(value)) return 'هذا الحقل مطلوب';
    return null;
  }

  static String? emailValidator(String? value) {
    if (isValueEmpty(value)) return 'هذا الحقل مطلوب';
    if (!AppRegex.isValidEmail(value!)) return 'البريد الإلكتروني غير صحيح';
    return null;
  }

  static String? passwordValidator(String? value) {
    if (isValueEmpty(value)) return 'يرجى إدخال كلمة المرور';
    if (value!.length < 6) return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    if (!AppRegex.hasLowerCase(value)) return 'كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل';
    if (!AppRegex.hasUpperCase(value)) return 'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل';
    if (!AppRegex.hasNumber(value)) return 'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل';
    if (!AppRegex.hasSpecialCharacter(value)) return 'كلمة المرور يجب أن تحتوي على رمز خاص واحد على الأقل';
    return null;
  }

  static String? binCodeTextFormFieldValidator(String? value) {
    if (isValueEmpty(value) || value!.length < 4) return 'يرجى إدخال الرمز الصحيح';
    return null;
  }

  static String? validateName(String? value) {
    if (isValueEmpty(value)) return 'يرجى إدخال الاسم';
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (isValueEmpty(value)) return 'يرجى إدخال رقم الهاتف';
    if (!AppRegex.isPhoneNumberValid(value!)) return 'يرجى إدخال رقم هاتف صحيح';
    return null;
  }

  static String? validateAddress(String? value) {
    if (isValueEmpty(value)) return 'يرجى إدخال العنوان';
    return null;
  }

  static String? validateBirthDate(String? value) {
    if (isValueEmpty(value)) return 'يرجى اختيار تاريخ الميلاد';
    return null;
  }

  static String? validateCity(String? value) {
    if (isValueEmpty(value)) return 'يرجى اختيار المدينة';
    return null;
  }

  static String? validateCountry(String? value) {
    if (isValueEmpty(value)) return 'يرجى اختيار الدولة';
    return null;
  }

  static String? validateSpecialization(String? value) {
    if (isValueEmpty(value)) return 'يرجى إدخال التخصص';
    return null;
  }

  static String? validateLicenseNumber(String? value) {
    if (isValueEmpty(value)) return 'يرجى إدخال رقم الترخيص';
    if (value!.length < 5) return 'رقم الترخيص يجب أن يكون 5 أرقام على الأقل';
    return null;
  }

  static bool isValueEmpty(String? value) {
    if (value == null || value.trim().isEmpty) return true;
    return false;
  }
}