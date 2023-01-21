import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'validators.dart';
import 'dart:developer' as console;

class Bloc with Validators {
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Stream get email => _emailController.stream.transform(validateEmail);

  Function(String) get changePassword => _passwordController.sink.add;
  Stream get password => _passwordController.stream.transform(validatePassword);

  Stream<bool> get canBeSubmitted =>
      Rx.combineLatest2(email, password, (email, password) {
        return true;
      });

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    console.log("$validEmail, $validPassword");
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
