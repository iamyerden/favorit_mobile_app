import 'package:favorite/presentation/auth/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigator_state.dart';
import 'widgets/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DataProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: IndexScreen(id: 0,),
          home: LoginScreen(),
          navigatorKey: GlobalVariable.navState,
        ));
  }
}
