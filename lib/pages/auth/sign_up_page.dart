import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/base/show_custom_snack_bar.dart';
import 'package:learn_flutter/controllers/auth_controller.dart';
import 'package:learn_flutter/models/signup_body_model.dart';
import 'package:learn_flutter/utils/dimensions.dart';
import 'package:learn_flutter/widgets/app_text_field.dart';
import 'package:learn_flutter/widgets/big_text.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];
    void _registration(){
      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty){
        showCustomSnackBar("Type in your name", title: "Name");
      } else if(phone.isEmpty){
        showCustomSnackBar("Type in your phone", title: "Phone number");
      } else if(email.isEmpty){
        showCustomSnackBar("Type in your email address", title: "Email address");
      } else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address", title: "Valid email address");
      } else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "Password");
      } else if(password.length<6) {
        showCustomSnackBar("Password can not be less than six characters", title: "Password");
      } else {
        showCustomSnackBar("All went well", title: "Perfect");
        SignUpBody signUpBody = SignUpBody(name: name, phone: phone, email: email, password: password);

        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print("Success registration");
            Get.offNamed(RouteHelper.getInitial());
          } else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
            // emailController
            AppTextField(
              textController: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
            SizedBox(
              height: Dimensions.height20,
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
            // nameController
            AppTextField(
              textController: nameController,
              hintText: "Name",
              icon: Icons.person_2_sharp,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            // phoneController
            AppTextField(
              textController: phoneController,
              hintText: "Phone",
              icon: Icons.phone_sharp,
            ),
            SizedBox(
              height: Dimensions.radius30,
            ),

            GestureDetector(
              onTap: (){
                _registration();
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
                      text: "Sign up",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                      color: Colors.white,
                    ),
                  )),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(RouteHelper.getSignIn()),
                  text: "Have an account already?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20,
                  )),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Sign up using one of the following methods",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font16,
                  )),
            ),
            Wrap(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: CircleAvatar(
                          radius: Dimensions.radius20,
                          backgroundImage:
                              AssetImage("assets/images/" + signUpImages[index]),
                        ),
                      )),
            )
          ],
        ),
      ),
    );

  }
}
