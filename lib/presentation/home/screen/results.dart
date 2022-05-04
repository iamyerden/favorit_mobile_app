import 'package:favorite/base/base_provider.dart';
import 'package:favorite/presentation/home/provider/home_provider.dart';
import 'package:favorite/shared/size_config.dart';
import 'package:favorite/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../shared/theme.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<HomeProvider>(
        model: HomeProvider(),
        onReady: (value) async => await value.init(context),
        builder: (context, model, child) {
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: getProportionateScreenHeight(10)),
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(4),
                      horizontal: getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: AppColors.hintTextColor),
                      SizedBox(
                        width: getProportionateScreenWidth(5),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Пойск",
                            hintStyle: TextStyle(
                              color: AppColors.hintTextColor,
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (String keyword) {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                button_sport(context, "Скачать PDF", model.isButtonEnabled,
                    model.downloadPdf()),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                    height: getProportionateScreenHeight(40),
                    decoration: BoxDecoration(
                      color: AppColors.containerBackColor,
                    ),
                    margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(3),
                        horizontal: getProportionateScreenWidth(3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('ТРЕНЕР'),
                        Text('ЗОЛОТО'),
                        Text('СЕРЕБРО'),
                      ],
                    )),
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: model.results.length,
                  itemBuilder: (context, index) => Container(
                      height: getProportionateScreenHeight(40),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                      ),
                      margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(3),
                          horizontal: getProportionateScreenWidth(3)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10)),
                            child: Text(model.results[index]['title']),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(30),
                          ),
                          Text(model.results[index]['subtitle']),
                          SizedBox(
                            width: getProportionateScreenWidth(100),
                          ),
                          Text(model.results[index]['num']),
                        ],
                      )),
                ),
              ],
            ),
          ));
        });
  }
}
