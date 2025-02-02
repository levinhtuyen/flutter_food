import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/base/custom_loader.dart';
import 'package:learn_flutter/controllers/auth_controller.dart';
import 'package:learn_flutter/pages/auth/sign_up_page.dart';
import 'package:learn_flutter/utils/dimensions.dart';
import 'package:learn_flutter/widgets/app_text_field.dart';
import 'package:learn_flutter/widgets/big_text.dart';
import 'package:get/get.dart';
import '../../base/show_custom_snack_bar.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();

    void _login(AuthController authController){


      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

       if(phone.isEmpty){
        showCustomSnackBar("Type in your phone", title: "Phone number");
      }  else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "Password");
      } else if(password.length<6) {
        showCustomSnackBar("Password can not be less than six characters", title: "Password");
      } else {

        authController.login(phone, password).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
          } else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder:(authController){
        return !authController.isLoading ? SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/logo part 1.png"),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: Dimensions.width20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Sign into your account",
                        style: TextStyle(
                            fontSize: Dimensions.font20,
                            color: Colors.grey[500])),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.screenHeight * 0.05),
              // phoneController
              AppTextField(
                textController: phoneController,
                hintText: "Phone",
                icon: Icons.phone_sharp,
              ),
              SizedBox(
                height: Dimensions.radius30,
              ),
              // passwordController
              AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp,
                isObscure: true,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              // phoneController


              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: Container()),
                  RichText(
                    text: TextSpan(
                      text: "Sign into your account",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20),
                    ),
                  ),
                  SizedBox(width: Dimensions.width20),
                ],
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  print('click sign in');
                  Get.toNamed(RouteHelper.getInitial());
                  _login(authController);
                },
                child: Container(
                    width: Dimensions.screenWidth / 2,
                    height: Dimensions.screenHeight / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor,
                    ),
                    child: Center(
                      child: BigText(
                        text: "Sign in",
                        size: Dimensions.font20 + Dimensions.font20 / 2,
                        color: Colors.white,
                      ),
                    )),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                    text: "Don\'t have an account?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => SignUpPage(), transition: Transition.fade),
                        text: " Create",
                        style: TextStyle(
                            color: AppColors.titleColor,
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ):CustomLoader() ;
      })
    );
  }
}
