import 'package:favorite/base/base_provider.dart';
import 'package:favorite/presentation/auth/screen/login.dart';
import 'package:favorite/shared/size_config.dart';
import 'package:favorite/shared/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/button.dart';
import '../provider/create_provider.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<CreateProvider>(
        model: CreateProvider(),
        onReady: (value) async => await value.init(context),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.whiteColor,
              title: Text('Создать Турнир',
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(16),
                      color: Colors.black)),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(40),
                  horizontal: getProportionateScreenWidth(25)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: SvgPicture.asset(SvgImages.cityImages)),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Text(
                    'Трубуется разрешение',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: getProportionateScreenHeight(28.13),
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Text(
                    'Нет доступа для создания турнира. Свзжитесь с модератором или войдите в аккаунт с правом доступа',
                    softWrap: true,
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(20),
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  button(context, "Запросить доступ", model.isButtonEnabled,
                      () {
                    model.request(context);
                  }),
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Другой аккаунт?",
                        style: TextStyle(
                            color: AppColors.loginColor,
                            fontSize: getProportionateScreenHeight(17)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginScreen())),
                              (route) => false);
                        },
                        child: Text(
                          "Ввойти в другой аккаунт",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: getProportionateScreenHeight(16)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
