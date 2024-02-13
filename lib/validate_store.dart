import 'package:mobx/mobx.dart';

part 'validate_store.g.dart';

class ValidateStore = _ValidateStore with _$ValidateStore;

abstract class _ValidateStore with Store {
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool passwordVisible = false;

  @computed
  bool get isFormValid =>
      name.isNotEmpty && email.isNotEmpty && password.isNotEmpty;

  @computed
  String? get nameError => name.isEmpty
      ? "Enter Your Name"
      : (name.length < 5 ? "Name Should Be Above 5" : null);

  @computed
  String? get emailError => email.isEmpty
      ? "Enter Your Mail"
      : null; // You can add more validations here

  @computed
  String? get passwordError => password.isEmpty
      ? "Enter Your Password"
      : null; // You can add more validations here

  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  void submit() {
    // Perform submission logic here
  }
}
