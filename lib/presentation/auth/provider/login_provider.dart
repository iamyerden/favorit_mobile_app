import 'package:favorite/base/base_bloc.dart';
import 'package:favorite/shared/size_config.dart';
import 'package:flutter/material.dart';

import '../../index/screen/index.dart';

class LoginProvider extends BaseBloc {
  Size? size;
  bool isButtonEnabled = true;
  init(BuildContext context) async {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    setLoading(false);
  }

  login(BuildContext context) async {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => IndexScreen()), (route) => false);
  }
}
