import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/pages/auth/sign_in_page.dart';
import 'package:learn_flutter/pages/auth/sign_up_page.dart';
import 'package:learn_flutter/pages/home/home_page.dart';
import '../routes/route_helper.dart';
import '../controllers/cart_controller.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../pages/home/food_page_body.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../helper/dependencies.dart' as dep;
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MainFoodPage());
}

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          title: 'Flutter Demo',
          // home: SignInPage(),
          // home: HomePage(),
          initialRoute: RouteHelper.getSplashScreen(),
          getPages: RouteHelper.routes,
        );

      });
    });
  }
}

