import 'package:flutter/material.dart';
import 'package:riverpod_firebase/reusable/drawer.dart';

import '../../constants/constants.dart';

class Homepage extends StatelessWidget {
  static const route = '/homepage';
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Constants.kFirebaseWithRiverpod,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Text('Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
