import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:riverpod_firebase/provider/auth_provider.dart';
import 'package:riverpod_firebase/reusable/text_form_field.dart';
import 'package:riverpod_firebase/screens/authentication/register.dart';
import 'package:riverpod_firebase/screens/loading.dart';

import '../../constants/constants.dart';

class LoginScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  static const route = '/login';
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authModel = ref.watch(provider);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                onChanged: (value) => authModel.email = value!,
                validator:
                    EmailValidator(errorText: Constants.kEnterValidEmail),
                initialValue: authModel.email,
                labelText: Constants.kEmail,
              ),
              const SizedBox(
                height: 24,
              ),
              Consumer(
                builder: ((context, ref, child) {
                  ref.watch(provider.select((value) => value.password));

                  return CustomTextFormField(
                      onChanged: (value) => authModel.password = value!,
                      validator: MinLengthValidator(8,
                          errorText: Constants.kPasswordRule),
                      initialValue: authModel.password,
                      labelText: Constants.kPassword);
                }),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await authModel.login();
                      Navigator.pushReplacementNamed(
                        context,
                        LoadingScreen.route,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "$e",
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  }
                },
                child: const Text(Constants.kLogin),
              ),
              Consumer(
                builder: ((context, ref, child) {
                  return TextButton(
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'No Account?  ',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        TextSpan(
                          text: Constants.kRegister,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ]),
                    ),
                    onPressed: () {
                      ref.refresh(provider);
                      Navigator.pushReplacementNamed(
                        context,
                        RegisterScreen.route,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
