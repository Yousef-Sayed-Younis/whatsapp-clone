import '../../../data/app_api.dart';
import '../base/controller.dart';
import '../base/field_type.dart';

class LoginController extends AuthController {
  LoginController() : super([FieldType.email, FieldType.password]);

  @override
  Future<bool> authenticate() async {
    if (formKey.currentState?.validate() ?? false) {
      String email = getFieldValue(FieldType.email);
      String password = getFieldValue(FieldType.password);

      try {
        return await AppServiceClient.login(EmailPasswordLogin(email: email, password: password));
      } catch (e) {
        return false;
      }
    }

    return false;
  }
}
