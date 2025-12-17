import 'dart:developer';

mixin class TextFieldValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateAngolaPhoneNumber(String? value) {
    log('Validating Angola phone number: $value');
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu número de telefone';
    }
    final phoneRegex = RegExp(r'^(?:\+244|00244|0)?9[1-9]\d{7}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Por favor, insira um número de telefone angolano válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha';
    }
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }

    return null;
  }

  static String validName(String? value) {
    if (value!.split(' ').length < 2) {
      return 'Por favor, insira seu primeiro e último nome';
    }
    return '';
  }
}
