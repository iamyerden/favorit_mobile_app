import 'package:favorite/base/base_provider.dart';
import 'package:favorite/presentation/auth/provider/login_provider.dart';
import 'package:favorite/shared/size_config.dart';
import 'package:favorite/shared/theme.dart';
import 'package:favorite/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/loading_view.dart';
import '../provider/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<LoginProvider>(
        model: LoginProvider(),
        onReady: (value) => value.init(context),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: AppColors.whiteColor,
                  body: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(80.33),
                        horizontal: getProportionateScreenWidth(25.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SvgPicture.asset(SvgImages.logoImages),
                        SizedBox(
                          height: getProportionateScreenHeight(60.33),
                        ),
                        Text(
                          'Авторазиция',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: getProportionateScreenHeight(28)),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Или',
                                style: TextStyle(
                                    color: AppColors.loginColor,
                                    fontSize: getProportionateScreenHeight(18),
                                    fontWeight: FontWeight.w500)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  getProportionateScreenWidth(8.0), 0, 0, 0),
                              child: Text('Зарегистрироваться',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize:
                                          getProportionateScreenHeight(18.0))),
                            )
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(28.0)),
                        Text('Логин',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: getProportionateScreenHeight(18.0))),
                        SizedBox(height: getProportionateScreenHeight(6.0)),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Введите названия '),
                        ),
                        SizedBox(height: getProportionateScreenHeight(25.0)),
                        Text('Пароль',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: getProportionateScreenHeight(18))),
                        SizedBox(height: getProportionateScreenHeight(6.0)),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Введите пароль '),
                        ),
                        SizedBox(height: getProportionateScreenHeight(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Забыли пароль?',
                                style: TextStyle(
                                    color: AppColors.loginColor,
                                    fontSize: getProportionateScreenHeight(17),
                                    fontWeight: FontWeight.w500)),
                            Text('Восcтановить пароль',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize:
                                        getProportionateScreenHeight(17))),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(55)),
                        Center(
                          child: Text('Или',
                              style: TextStyle(
                                  color: AppColors.loginColor,
                                  fontSize: getProportionateScreenHeight(18),
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(9),
                              vertical: getProportionateScreenHeight(12)),
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffE5E5E5),
                                    offset: Offset(0, 4),
                                    blurRadius: 1)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(SvgImages.googleImages),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    getProportionateScreenWidth(24.0), 0, 0, 0),
                                child: Text('Sign in with Google',
                                    style: TextStyle(
                                        color: AppColors.systemBlackColor,
                                        fontSize:
                                            getProportionateScreenHeight(16),
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20.0),
                        ),
                        custom_button(context, model.size!, "Войти",
                            model.isButtonEnabled, () {
                          model.login(context);
                        }),
                      ],
                    ),
                  ),
                );
        });
  }
}
