import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase/provider/auth_provider.dart';
import 'package:riverpod_firebase/screens/authentication/login.dart';

import 'home.dart';

class HomeFlow extends ConsumerWidget {
  static const route = '/homeflow';
  const HomeFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRef = ref.read(provider);
    return authRef.user != null ? const Homepage() : LoginScreen();
  }
}
