import 'package:favorite/presentation/home/screen/fights.dart';
import 'package:favorite/presentation/home/screen/fights_detail.dart';
import 'package:favorite/presentation/home/screen/home_index.dart';
import 'package:favorite/presentation/home/screen/list.dart';
import 'package:favorite/presentation/home/screen/team_detail.dart';
import 'package:favorite/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../base/base_bloc.dart';
import '../../../shared/size_config.dart';
import '../../index/screen/index.dart';

class HomeProvider extends BaseBloc {
  Size? size;
  bool isButtonEnabled = true;
  List<double> heightsOfFights = [];
  int count = 0;
  bool isVisible = true;

  init(BuildContext context) async {
    setLoading(true);
    size = MediaQuery.of(context).size;
    heightsOfFights = List.generate(fight.length, (index) => 0);
    SizeConfig().init(context);

    setLoading(false);
  }

  visible() async {
    isVisible = !isVisible;
    notifyListeners();
  }

  final elements = [
    {'group': 'Одиночные туриниры', 'title': 'Бокс', 'teke': '1 вид '},
    {'group': 'Групповые туриниры', 'title': 'Дзюдо', 'teke': '2 вид '}
  ];

  append(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ListScreen()),
    );
  }

  next(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomeIndexScreen()),
    );
  }

  next1(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FightDetailScreen()),
    );
  }

  final data = [
    {
      'group': 'Идет',
      'title': 'Ранг Городские',
      'sub': 'КР таеквондо федерациясынын тунгыш ',
      'num': '310/600',
      'finish': 'Осталось 24 дн'
    },
    {
      'group': 'Май',
      'title': 'Ранг Городские',
      'sub': 'КР таеквондо федерациясынын ',
      'num': '310/600',
      'finish': 'Осталось 24 дн'
    },
  ];
  final List fightDetail = List.generate(2, (index) {
    return {
      'group': 'День 1',
      'age': '18-21',
      'index': index,
      'fight': '91',
      'weight': '70',
      'cort': '1',
      'tournament': '1/16 Финала',
      'tournament1': '1/8 Финала',
      'tournament2': 'Полуфинал',
      'tournament3': 'Финал',
    };
  });

  final List<FightModel> fight = [
    FightModel(
        group: 'День 1',
        age: '18,21',
        index: '1',
        fight: '91',
        weight: '50,60',
        color: Colors.red,
        cort: '1'),
    FightModel(
        group: 'День 2',
        age: '18,21',
        index: '2',
        fight: '91',
        weight: '50,60',
        color: Colors.blue,
        cort: '1'),
    FightModel(
        group: 'День 1',
        age: '18,21',
        index: '3',
        fight: '91',
        weight: '50,60',
        color: Colors.green,
        cort: '2'),
  ];

  defineColor(int index) {
    switch (index) {
      case 1:
        return AppColors.systemRedColor;
      case 2:
        return AppColors.primaryColor;
      case 3:
        return AppColors.systemBlackColor;
    }
  }

  final List team = List.generate(3, (index) {
    return {
      "id": index,
      "title": "Бексейт Тулкиев",
      "subtitle": "Тараз",
      "num": "36"
    };
  });
  final List teamDetail = List.generate(10, (index) {
    return {
      "id": index,
      "title": "Алиаскар Хасенов ",
      "subtitle": "Взрослые -54  (М)"
    };
  });
  final List results = List.generate(3, (index) {
    return {
      "id": index,
      "title": "Бексейт Тулкиев",
      "subtitle": "7",
      "num": "3"
    };
  });

  navigateToDetail(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TeamDetailScreen()),
    );
  }

  downloadPdf() {}

  back(BuildContext context) async {
    Navigator.pop(context);
  }

  void setHeightToContainerFight(double constrainHeight) {
    heightsOfFights[count] = constrainHeight;
    count++;
    notifyListeners();
  }

  getDefinedHeightByElement(FightModel element) {
    for (int i = 0; i < fight.length; i++) {
      if (element == fight[i]) {
        return heightsOfFights[i];
      }
    }
  }
}

class FightModel {
  String? group;
  String? index;
  String? cort;
  String? fight;
  String? age;
  String? weight;
  Color? color;

  FightModel(
      {this.group,
      this.age,
      this.cort,
      this.fight,
      this.index,
      this.weight,
      this.color});
}
