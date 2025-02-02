
import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/big_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'app_icon.dart';

class AccountWidget extends StatelessWidget {

  AppIcon appIcon;
  BigText bigText;
  AccountWidget({required this.appIcon, required this.bigText});
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.width20,
          bottom: Dimensions.width20
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width20,),
          bigText
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2)
          )
        ]
      ),
    );
  }
}

