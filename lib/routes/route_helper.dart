import 'package:get/get.dart';
import 'package:learn_flutter/pages/auth/sign_in_page.dart';
import 'package:learn_flutter/pages/auth/sign_up_page.dart';
import '../pages/cart/cart_page.dart';
import '../pages/food/popular_food_detail.dart';
import '../pages/home/home_page.dart';
import '../pages/splash/splash_page.dart';

import '../pages/food/recommended_food_detail.dart';

class RouteHelper {
  static const String splashPage = "/splash_page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  static const String signUp = "/sign-up";

  static String getSplashScreen() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=${page}';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=${page}';
  static String getCartPage() => "$cartPage";

  static String getSignIn() => "$signIn";
  static String getSignUp() => "$signUp";

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return PopularFoodDetail(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return RecommendedFoodDetail(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage, page: () => CartPage(), transition: Transition.fadeIn),
    GetPage(
        name: signIn, page: () => SignInPage(), transition: Transition.fadeIn),
    GetPage(
        name: signUp, page: () => SignUpPage(), transition: Transition.fadeIn),
  ];

  static get pageId => null;
}
