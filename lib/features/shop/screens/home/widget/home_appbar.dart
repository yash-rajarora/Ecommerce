import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/constants/text_strings.dart';
import 'package:ecom/common/widget/appbar/appbar.dart';
import 'package:ecom/common/widget/product/cart/cart_menu_icon.dart';
import 'package:ecom/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            ()=> Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            ),
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(onPressed: (){},)
      ],
    );
  }
}