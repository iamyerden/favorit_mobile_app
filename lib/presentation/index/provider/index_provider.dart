import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../base/base_bloc.dart';
import '../../../shared/size_config.dart';
import '../../../shared/theme.dart';

class IndexProvider extends BaseBloc {
  int bottomIndex = 0;
  final controller = ScrollController();
  List<BottomNavigationBarItem>? items;

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    setItems();
    setLoading(false);
  }

  setItems() {
    items = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          SvgImages.homeImages,
          width: getProportionateScreenHeight(38),
          height: getProportionateScreenHeight(26),
        ),
        activeIcon: SvgPicture.asset(
          SvgImages.homeActiveImages,
          width: getProportionateScreenHeight(38),
          height: getProportionateScreenHeight(26),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          SvgImages.createImages,
          width: getProportionateScreenHeight(38),
          height: getProportionateScreenHeight(26),
        ),
        activeIcon: SvgPicture.asset(
          SvgImages.createActiveImages,
          width: getProportionateScreenHeight(38),
          height: getProportionateScreenHeight(26),
        ),
        label: 'Create',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          SvgImages.accountImages,
          width: getProportionateScreenHeight(38),
          height: getProportionateScreenHeight(26),
        ),
        activeIcon: SvgPicture.asset(
          SvgImages.accountActiveImages,
          width: getProportionateScreenHeight(38),
          height: getProportionateScreenHeight(26),
        ),
        label: 'Account',
      ),
     
    ];
    notifyListeners();
  }

  bool isFirst = true;
  setBottomIndex(int index, context) {
    bottomIndex = index;
    log('Bottom index: $bottomIndex');
    // if (bottomIndex != 0) {
    //   isFirst ? Navigator.pop(context) : null;
    // }
    bottomIndex != 0 ? isFirst = false : isFirst = true;

    notifyListeners();
  }
}