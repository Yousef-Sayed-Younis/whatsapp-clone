import '../../../data/app_api.dart';
import '../base/controller.dart';
import '../base/field_type.dart';

class RegisterController extends AuthController {
  RegisterController() : super([FieldType.username, FieldType.email, FieldType.phone, FieldType.password]);

  @override
  Future<bool> authenticate() async {
    if (formKey.currentState!.validate()) {
      String username = getFieldValue(FieldType.username);
      String email = getFieldValue(FieldType.email);
      String phone = getFieldValue(FieldType.phone);
      String password = getFieldValue(FieldType.password);

      return await AppServiceClient.register(EmailPasswordRegister(email: email, password: password, phone: phone, username: username));
    }

    return false;
  }
}
