import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase/provider/auth_provider.dart';
import 'package:riverpod_firebase/screens/loading.dart';
import '../constants/constants.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRef = ref.read(provider);
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 25,
              bottom: 10,
            ),
            child: Column(
              children: [
                Text(
                  authRef.user!.email!,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 20, fontFamily: "Train"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.only(top: 1.0),
            child: Column(
              children: const [
                Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: const Text(
              Constants.kLogOut,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              ref.refresh(provider);
              ref.read(provider).logout();
              Navigator.pushReplacementNamed(context, LoadingScreen.route);
            },
          ),
          const Divider(
            height: 10,
            color: Colors.grey,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
