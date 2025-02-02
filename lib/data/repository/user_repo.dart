import 'package:get/get_connect.dart';
import 'package:learn_flutter/data/api/api_client.dart';
import 'package:learn_flutter/utils/app_constants.dart';

class UserRepo{
  final ApiClient apiClient;
  UserRepo({ required this.apiClient});
  
  Future<Response> getUserInfo()async{
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}