import 'package:form_field_validator/form_field_validator.dart';

final validatedEmail = MultiValidator([
  RequiredValidator(errorText: 'Input email'),
  EmailValidator(errorText: 'Fomat email tidak sesuai')
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Input password'),
  MinLengthValidator(8, errorText: 'password minimal 8 karakter')
]);
