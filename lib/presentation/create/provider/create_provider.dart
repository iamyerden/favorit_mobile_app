import 'package:flutter/cupertino.dart';

import '../../../base/base_bloc.dart';
import '../../../shared/size_config.dart';

class CreateProvider extends BaseBloc {
  Size? size;
  bool isButtonEnabled = true;
  init(BuildContext context) async {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    setLoading(false);
  }
   
  request(BuildContext context ) async{
    
  }
}
