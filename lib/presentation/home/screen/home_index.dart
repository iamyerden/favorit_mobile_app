import 'package:favorite/base/base_provider.dart';
import 'package:favorite/presentation/home/provider/home_provider.dart';
import 'package:favorite/presentation/home/screen/fights.dart';
import 'package:favorite/presentation/home/screen/results.dart';
import 'package:favorite/presentation/home/screen/team.dart';
import 'package:favorite/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../shared/theme.dart';

class HomeIndexScreen extends StatelessWidget {
  const HomeIndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<HomeProvider>(
        model: HomeProvider(),
        onReady: (value) async => await value.init(context),
        builder: (context, model, child) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  leading: GestureDetector(
                      onTap: () async {
                        await model.back(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryColor,
                      )),
                  centerTitle: true,
                  backgroundColor: AppColors.whiteColor,
                  title: Text(
                    'Турнир',
                    style: TextStyle(color: Colors.black),
                  ),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        child: Text(
                          'Поединки ',
                          style: TextStyle(color: AppColors.textBackColor),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Команды ',
                          style: TextStyle(color: AppColors.textBackColor),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Результаты ',
                          style: TextStyle(color: AppColors.textBackColor),
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: AppColors.backgroundColor,
                body: TabBarView(
                  // physics: BouncingScrollPhysics(),
                  children: [FightScreen(), TeamScreen(), ResultScreen()],
                )),
          );
        });
  }
}
