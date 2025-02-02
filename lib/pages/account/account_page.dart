import 'package:flutter/material.dart';
import 'package:learn_flutter/base/custom_loader.dart';
import 'package:learn_flutter/controllers/auth_controller.dart';
import 'package:learn_flutter/controllers/cart_controller.dart';
import 'package:learn_flutter/controllers/user_controller.dart';
import 'package:learn_flutter/utils/dimensions.dart';
import 'package:learn_flutter/widgets/account_widget.dart';
import 'package:learn_flutter/widgets/app_icon.dart';
import 'package:learn_flutter/widgets/big_text.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {

    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          color: Colors.white,
          size: 24,
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn?(userController.isLoading)?
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Dimensions.height10),
          child: Column(children: [
            // profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize:
              Dimensions.height45 + Dimensions.height30,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.mobile_friendly_outlined,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: userController.userModel.name)),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Name icon
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: userController.userModel.phone)),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Email icon
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email_outlined,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: userController.userModel.email)),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Address icon
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Go Vap, Ho Chi Minh city")),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Messages icon
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message_outlined,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Le Vinh Tuyen")),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Messages icon
                    GestureDetector(
                      onTap: (){
                        if(Get.find<AuthController>().userLoggedIn()){
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getSplashScreen());
                        } else {
                          print("you logged out");
                        }
                      },
                      child: AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.logout_outlined,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: BigText(text: "Logout")),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ):
        CustomLoader() :
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Dimensions.height10),
          child: Column(children: [
            // profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize:
              Dimensions.height45 + Dimensions.height30,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.mobile_friendly_outlined,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Le Vinh Tuyen")),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Name icon
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "0338524407")),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Email icon
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email_outlined,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "levinhtuyen210@gmail.com")),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Address icon
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Go Vap, Ho Chi Minh city")),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Messages icon
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message_outlined,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Le Vinh Tuyen")),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // Messages icon
                    GestureDetector(
                      onTap: (){
                        if(Get.find<AuthController>().userLoggedIn()){
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getSplashScreen());
                        } else {
                          print("you logged out");
                        }
                      },
                      child: AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.logout_outlined,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: BigText(text: "Logout")),
                    ),
                  ],
                ),
              ),
            )
          ]),
        );
      }),
    );
  }
}
