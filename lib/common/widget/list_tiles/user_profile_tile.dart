import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/common/widget/shimmers/shimmer.dart';
import 'package:ecom/common/widget/images/t_circular_image.dart';
import 'package:ecom/features/personalization/controllers/user_controller.dart';
import 'package:ecom/features/personalization/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(
            () {
          final networkImage =
              controller.user.value.profilePicture;
          final isNetwork = networkImage.isNotEmpty;
          final image = isNetwork ? networkImage : TImages.user;
          return controller.imageUploading.value
              ? const TShimmerEffect(width: 55, height: 55, radius: 55)
              : TCircularImage(
            image: image,
            isNetworkImage: isNetwork,
            width: 55,
            height: 55,
          );
        },
      ),
      title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.white)),
      trailing: IconButton(onPressed: ()=>Get.to(const ProfileScreen()), icon: const Icon(Iconsax.edit,color: TColors.white)),
    );
  }
}