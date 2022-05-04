import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../shared/theme.dart';


class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitCircle(
        size: MediaQuery.of(context).size.width * 0.4,
        color: AppColors.primaryColor,
      ),
    );
  }
}

