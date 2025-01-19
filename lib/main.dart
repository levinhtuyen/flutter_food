import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      // home: MainFoodPage(),
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}

