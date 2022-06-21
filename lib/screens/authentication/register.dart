import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:riverpod_firebase/provider/auth_provider.dart';
import 'package:riverpod_firebase/reusable/custom_appbar.dart';
import 'package:riverpod_firebase/screens/authentication/login.dart';
import 'package:riverpod_firebase/screens/loading.dart';
import '../../constants/constants.dart';

class RegisterScreen extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const route = '/register';
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //rebuilds when data changes in our provider.
    final authModel = ref.watch(provider);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Register Screen',
        leadingIcon: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              ref.refresh(provider);
              Navigator.pushReplacementNamed(
                context,
                LoginScreen.route,
              );
            }),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                onChanged: (v) => authModel.email = v,
                validator:
                    EmailValidator(errorText: Constants.kEnterValidEmail),
                initialValue: authModel.email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: Constants.kEmail,
                ),
              ),
              TextFormField(
                onChanged: (v) => authModel.password = v,
                validator:
                    MinLengthValidator(8, errorText: Constants.kPasswordRule),
                initialValue: authModel.password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: authModel.obscure,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(authModel.obscure
                        ? Icons.lock_clock_outlined
                        : Icons.lock_open),
                    onPressed: () {
                      authModel.obscure = !authModel.obscure;
                    },
                  ),
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: Constants.kPassword,
                ),
              ),
              TextFormField(
                onChanged: (v) => authModel.confirmPassord = v,
                validator: (v) =>
                    v != authModel.password ? "password don't match" : null,
                initialValue: authModel.confirmPassord,
                keyboardType: TextInputType.visiblePassword,
                obscureText: authModel.obscureConfirm,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(authModel.obscureConfirm
                        ? Icons.lock_clock_outlined
                        : Icons.lock_open),
                    onPressed: () {
                      authModel.obscureConfirm = !authModel.obscureConfirm;
                    },
                  ),
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: Constants.kConfirmPassword,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await authModel.register();
                      Navigator.pushReplacementNamed(
                          context, LoadingScreen.route);
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
                child: const Text(Constants.kRegister),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
