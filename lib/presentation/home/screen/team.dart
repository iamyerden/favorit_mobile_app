import 'package:favorite/base/base_provider.dart';
import 'package:favorite/presentation/home/provider/home_provider.dart';
import 'package:favorite/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../shared/theme.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<HomeProvider>(
        model: HomeProvider(),
        onReady: (value) async => await value.init(context),
        builder: (context, model, child) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
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
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.team.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () async {
                        model.navigateToDetail(context);
                      },
                      child: Card(
                        elevation: 0,
                        margin: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(3),
                            horizontal: getProportionateScreenWidth(3)),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(model.team[index]["id"].toString()),
                            backgroundColor: Colors.purple,
                          ),
                          title: Text(model.team[index]["title"]),
                          subtitle: Text(model.team[index]["subtitle"]),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
