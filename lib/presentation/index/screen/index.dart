import 'package:favorite/presentation/auth/screen/login.dart';
import 'package:favorite/presentation/create/screen/create.dart';
import 'package:flutter/material.dart';

import '../../../base/base_provider.dart';
import '../../../shared/size_config.dart';
import '../../../shared/theme.dart';
import '../../account/screen/account.dart';
import '../../home/screen/home.dart';
import '../provider/index_provider.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<IndexProvider>(
      onReady: (p0) => p0.init(context),
      model: IndexProvider(),
      builder: (context, model, child) {
        return Scaffold(
          body: _body[model.bottomIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            selectedFontSize: getProportionateScreenHeight(14),
            unselectedFontSize: getProportionateScreenWidth(10),
            unselectedItemColor: AppColors.systemBlackColor,
            showUnselectedLabels: true,
            currentIndex: model.bottomIndex,
            items: model.items!,
            onTap: (index) => model.setBottomIndex(index, context),
          ),
        );
      },
    );
  }
}

var _body = [HomeScreen(), CreateScreen(), AccountScreen()];
