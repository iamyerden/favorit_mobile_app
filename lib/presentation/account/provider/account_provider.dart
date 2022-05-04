import 'package:favorite/base/base_bloc.dart';
import 'package:favorite/shared/size_config.dart';
import 'package:flutter/material.dart';

class AccountProvider extends BaseBloc {
  Size? size;
  bool isButtonEnabled = true;
  init(BuildContext context) async {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    setLoading(false);
  }

  add_sports() async {}
}
