import 'package:favorite/shared/size_config.dart';
import 'package:favorite/shared/theme.dart';
import 'package:favorite/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../base/base_provider.dart';
import '../provider/account_provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AccountProvider>(
        model: AccountProvider(),
        onReady: (value) => value.init(context),
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: AppColors.whiteColor,
                title: Text(
                  'Аккаунт',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              backgroundColor: AppColors.backgroundColor,
              body: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(24),
                          horizontal: getProportionateScreenWidth(20)),
                      child: Text(
                        "Данные",
                        style: TextStyle(
                            color: AppColors.textBackColor, fontSize: 18),
                      ),
                    ),
                    Container(
                      color: AppColors.whiteColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(23),
                            horizontal: getProportionateScreenWidth(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: getProportionateScreenHeight(4),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    "https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg",
                                    height: getProportionateScreenHeight(106),
                                    width: getProportionateScreenWidth(106),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Жандеева Малика",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(14),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(SvgImages.editImages),
                                        Text("Изменить данные",
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Text("Cпортсменов",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Text("Активных : 15",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Text("Не активных: : 7",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Divider(
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                              height: getProportionateScreenHeight(1),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Text("Дата рождения:  01.01.2004",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: getProportionateScreenHeight(16),
                            ),
                            Text("Город:  Павлодар",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: getProportionateScreenHeight(16),
                            ),
                            Text("Команда:  СШИКОР г.Павлодар",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: getProportionateScreenHeight(16),
                            ),
                            Text("ФСТ: Без фст",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: getProportionateScreenHeight(16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(24),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Моя команда",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(
                            height: getProportionateScreenHeight(6),
                          ),
                          button_sport(context, "Добавить спортсмена",
                              model.isButtonEnabled, model.add_sports()),
                          SizedBox(
                            height: getProportionateScreenHeight(34),
                          ),
                          Text("Кадеты",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(6),
                    ),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          child: ClipOval(
                            child: Image.network(
                              'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg',
                            ),
                          ),
                        ),
                        title: Text('Алиаскар Хасенов',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        subtitle: Text('Взрослые -54  (М)',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          child: ClipOval(
                            child: Image.network(
                              'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg',
                            ),
                          ),
                        ),
                        title: Text('Агыбаев Алихан ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        subtitle: Text('Взрослые -68  (М)',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                          vertical: getProportionateScreenHeight(6)),
                      child: Text("Дети",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(6),
                    ),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          child: ClipOval(
                            child: Image.network(
                              'https://kurmashev.studio/wp-content/uploads/2021/12/mentor_alish_big.jpg',
                            ),
                          ),
                        ),
                        title: Text('Алиаскар Хасенов',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        subtitle: Text('Взрослые -54  (М)',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    )
                  ],
                ),
              ));
        });
  }
}
