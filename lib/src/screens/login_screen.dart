import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import 'dart:developer' as console;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailFieldWidget(bloc),
          passwordFieldWidget(bloc),
          const SizedBox(
            height: 20,
          ),
          submitButtonWidget(bloc)
        ],
      ),
    );
  }

  Widget submitButtonWidget(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.canBeSubmitted,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: (snapshot.hasData) ? bloc.submit : null,
          child: const Text("Login"),
        );
      },
    );
  }

  Widget passwordFieldWidget(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              hintText: "",
              labelText: "Password",
              errorText:
                  (snapshot.hasError) ? snapshot.error.toString() : null),
        );
      },
    );
  }

  Widget emailFieldWidget(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
              hintText: "you@example.com",
              labelText: "Email Address",
              errorText:
                  (snapshot.hasError) ? snapshot.error.toString() : null),
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }
}
