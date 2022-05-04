import 'package:favorite/base/base_provider.dart';
import 'package:favorite/presentation/home/provider/home_provider.dart';
import 'package:favorite/shared/size_config.dart';
import 'package:favorite/widgets/button.dart';
import 'package:favorite/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../shared/theme.dart';

class FightDetailScreen extends StatelessWidget {
  const FightDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<HomeProvider>(
        model: HomeProvider(),
        onReady: (value) async => await value.init(context),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
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
                  ),
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
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: model.fightDetail.length,
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: getProportionateScreenHeight(10)),
                                  child: Text(model.fightDetail[index]
                                          ['group'] +
                                      '/' +
                                      'Корт' +
                                      model.fightDetail[index]['cort']),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Container(
                                  color: AppColors.whiteColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            getProportionateScreenWidth(20),
                                        vertical:
                                            getProportionateScreenWidth(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Возраст:' +
                                                model.fightDetail[index]
                                                    ['age']),
                                            Text('Весь:' +
                                                model.fightDetail[index]
                                                    ['weight']),
                                            Text('Мужчины')
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(10),
                                        ),
                                        button_sport(
                                            context,
                                            'Турнирная сетка',
                                            model.isButtonEnabled,
                                            model.downloadPdf()),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(10),
                                        ),
                                        Container(
                                          color: AppColors.containerBackColor,
                                          child: ExpansionTile(
                                            title: Text(model.fightDetail[index]
                                                    ['tournament']
                                                .toString()),
                                            trailing: const Icon(
                                                Icons.arrow_drop_down),
                                            children: [
                                              Container(
                                                color: AppColors.whiteColor,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('9:00-9:04'),
                                                        Text(
                                                          'Окончен',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .primaryColor),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Елшібай Елжан'),
                                                        Text('Анетов Мирас')
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 24,
                                                            child: ClipOval(
                                                              child: Image.network(
                                                                  'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg'),
                                                            )),
                                                        Text('24:2'),
                                                        CircleAvatar(
                                                            radius: 24,
                                                            child: ClipOval(
                                                              child: Image.network(
                                                                  'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg'),
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(10),
                                        ),
                                        Container(
                                          color: AppColors.containerBackColor,
                                          child: ExpansionTile(
                                            title: Text(model.fightDetail[index]
                                                    ['tournament1']
                                                .toString()),
                                            trailing: const Icon(
                                                Icons.arrow_drop_down),
                                            children: [
                                              Container(
                                                color: AppColors.whiteColor,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('9:00-9:04'),
                                                        Text(
                                                          'Окончен',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .primaryColor),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Елшібай Елжан'),
                                                        Text('Анетов Мирас')
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 24,
                                                            child: ClipOval(
                                                              child: Image.network(
                                                                  'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg'),
                                                            )),
                                                        Text('24:2'),
                                                        CircleAvatar(
                                                            radius: 24,
                                                            child: ClipOval(
                                                              child: Image.network(
                                                                  'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg'),
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(10),
                                        ),
                                        Container(
                                          color: AppColors.containerBackColor,
                                          child: ExpansionTile(
                                            title: Text(model.fightDetail[index]
                                                    ['tournament2']
                                                .toString()),
                                            trailing:
                                                Icon(Icons.arrow_drop_down),
                                            children: [
                                              Container(
                                                color: AppColors.whiteColor,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('9:00-9:04'),
                                                        Text(
                                                          'Окончен',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .primaryColor),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Елшібай Елжан'),
                                                        Text('Анетов Мирас')
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 24,
                                                            child: ClipOval(
                                                              child: Image.network(
                                                                  'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg'),
                                                            )),
                                                        Text('24:2'),
                                                        CircleAvatar(
                                                            radius: 24,
                                                            child: ClipOval(
                                                              child: Image.network(
                                                                  'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg'),
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(10),
                                        ),
                                        Container(
                                          color: AppColors.containerBackColor,
                                          child: ExpansionTile(
                                            title: Text(model.fightDetail[index]
                                                    ['tournament3']
                                                .toString()),
                                            trailing: const Icon(
                                                Icons.arrow_drop_down),
                                            children: [
                                              Container(
                                                color: AppColors.whiteColor,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('9:00-9:04'),
                                                        Text(
                                                          'Окончен',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .primaryColor),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Елшібай Елжан'),
                                                        Text('Анетов Мирас')
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 24,
                                                            child: ClipOval(
                                                              child: Image.network(
                                                                  'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg'),
                                                            )),
                                                        Text('24:2'),
                                                        CircleAvatar(
                                                            radius: 24,
                                                            child: ClipOval(
                                                              child: Image.network(
                                                                  'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg'),
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
        });
  }
}
