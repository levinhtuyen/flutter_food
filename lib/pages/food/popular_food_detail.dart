import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/popular_product_controller.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../widgets/app_column.dart';

import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // background image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.popularFoodImageSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(AppConstants.BASE_URL +
                              AppConstants.UPLOAD_URL +
                              product.img!),
                          fit: BoxFit.cover)),
                )),
            // Icon widgets
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (page == "cartpage") {
                            Get.toNamed(RouteHelper.getCartPage());
                          } else {
                            Get.toNamed(RouteHelper.getInitial());
                          }
                        },
                        child: AppIcon(icon: Icons.arrow_back_ios)),
                    GetBuilder<PopularProductController>(builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          if (controller.totalItems >= 1)
                            Get.toNamed(RouteHelper.getCartPage());
                        },
                        child: Stack(
                          children: [
                            AppIcon(
                              icon: Icons.shopping_cart_outlined,
                            ),
                            controller.totalItems >= 1
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.getCartPage());
                                      },
                                      child: AppIcon(
                                          icon: Icons.circle,
                                          size: 20,
                                          iconColor: Colors.transparent,
                                          backgroundColor: AppColors.mainColor),
                                    ),
                                  )
                                : Container(),
                            controller.totalItems >= 1
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: BigText(
                                      text: Get.find<PopularProductController>()
                                          .totalItems
                                          .toString(),
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    })
                  ],
                )),
            // Introduction of Food
            Positioned(
                left: 0,
                right: 0,
                height: Dimensions.popularFoodImageSize,
                top: Dimensions.popularFoodImageSize - Dimensions.height30,
                child: Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.height20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius30),
                          topRight: Radius.circular(Dimensions.radius30)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppColumn(
                          text: product.name!,
                        ),
                        SizedBox(height: Dimensions.height20),
                        BigText(text: 'Introduce'),
                        SizedBox(height: Dimensions.height20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                              text: product.description!,
                            ),
                          ),
                        ),
                      ],
                    ))),
            // Expandeble text widget
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  right: Dimensions.width20,
                  left: Dimensions.width20),
              decoration: BoxDecoration(
                color: AppColors.buttomBacgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        BigText(
                          text: popularProduct.inCartItems.toString(),
                          size: Dimensions.font16,
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      child: BigText(
                        text: "\$ ${product.price!} | Add to cart",
                        color: Colors.white,
                        size: Dimensions.font16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
