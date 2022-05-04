import 'package:favorite/base/base_provider.dart';
import 'package:favorite/presentation/home/provider/home_provider.dart';
import 'package:favorite/shared/size_config.dart';
import 'package:favorite/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../shared/theme.dart';

class FightScreen extends StatelessWidget {
  const FightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<HomeProvider>(
        model: HomeProvider(),
        onReady: (value) async => await value.init(context),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  backgroundColor: AppColors.backgroundColor,
                  body: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: getProportionateScreenHeight(10)),
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
                                Icon(Icons.search,
                                    color: AppColors.hintTextColor),
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
                        ),
                        GroupedListView<FightModel, String>(
                          shrinkWrap: true,
                          separator: SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          elements: model.fight,
                          groupBy: (element) => element.group!,
                          groupSeparatorBuilder: (value) => Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(20),
                                  vertical: getProportionateScreenHeight(10)),
                              child: Text("$value"),
                            ),
                          ),
                          itemBuilder: (context, element) => Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            color: element.color!,
                            child: Container(
                              color: AppColors.whiteColor,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  ListTile(
                                    onTap: () async {
                                      model.next1(context);
                                    },
                                    leading: Text('Корт' + ' ' + element.cort!),
                                    trailing:
                                        Text('Поединков:' + element.fight!),
                                  ),
                                  Container(
                                    color: AppColors.containerBackColor,
                                    child: ListTile(
                                      onTap: () async {
                                        model.next1(context);
                                      },
                                      dense: true,
                                      leading: Text('Возраст'),
                                      title: Text('Вес'),
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () async {
                                      model.next1(context);
                                    },
                                    dense: true,
                                    leading: Text(element.age!),
                                    title: Text(element.weight!),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
        });
  }
}
