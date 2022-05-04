import 'package:favorite/base/base_provider.dart';
import 'package:favorite/presentation/home/provider/home_provider.dart';
import 'package:favorite/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../shared/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<HomeProvider>(
        model: HomeProvider(),
        onReady: (value) async => await value.init(context),
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: AppColors.whiteColor,
                title: Text(
                  'Выбрать вид спорта',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              backgroundColor: AppColors.backgroundColor,
              body: Column(
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
                  ),
                  Expanded(
                    child: GroupedListView<dynamic, String>(
                      elements: model.elements,
                      groupBy: (element) => element['group'],
                      groupSeparatorBuilder: (value) => Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(5)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                              vertical: getProportionateScreenHeight(10)),
                          child: Text(value),
                        ),
                      ),
                      itemBuilder: (context, element) => Card(
                        elevation: 0,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(5),
                              horizontal: getProportionateScreenWidth(20)),
                          leading: Image.network(
                              'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg'),
                          title: Text(element['title']),
                          subtitle: Text(element['teke']),
                          trailing: GestureDetector(
                              onTap: () async {
                                model.append(context);
                              },
                              child: const Icon(Icons.arrow_forward_ios)),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
