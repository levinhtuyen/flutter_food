import 'package:get/get.dart';
import 'package:learn_flutter/data/repository/auth_repo.dart';
import 'package:learn_flutter/models/response_modal.dart';
import 'package:learn_flutter/models/signup_body_model.dart';
import 'package:learn_flutter/models/user_model.dart';
import 'package:learn_flutter/utils/app_constants.dart';

import '../data/repository/user_repo.dart';

class UserController extends GetxController implements GetxService{
  final UserRepo userRepo;
  UserController({required this.userRepo});


  bool _isLoading = false;
  late UserModel _userModel;

  bool get isLoading=> _isLoading;
  UserModel get userModel =>_userModel;

  Future<ResponseModel> getUserInfo() async{
    _isLoading = true;
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if(response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;

  }

  // Future<ResponseModel> login(String email, String password) async{
  //   _isLoading = true;
  //   Response response = await authRepo.login(email,password);
  //   late ResponseModel responseModel;
  //   if(response.statusCode == 200) {
  //     authRepo.saveUserToken(response.body["token"]);
  //     responseModel = ResponseModel(true, response.body["token"]);
  //   } else {
  //     responseModel = ResponseModel(false, response.statusText!);
  //   }
  //   _isLoading = false;
  //   update();
  //   return responseModel;
  //
  // }
  //
  // void saveUserNumberAndPassword(String number, String password) async {
  //   authRepo.saveUserNumberAndPassword(number, password);
  // }
  //
  // bool userLoggedIn() {
  //   return authRepo.userLoggedIn();
  // }
  //
  // bool clearSharedData(){
  //   return authRepo.clearSharedData();
  // }
}