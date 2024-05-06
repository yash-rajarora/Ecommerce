import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/common/widget/images/t_circular_image.dart';
import 'package:ecom/features/personalization/screens/profile/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        isNetworkImage: false,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Yash Raj Arora',style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text('yashrajofficial@gmail.com',style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.white)),
      trailing: IconButton(onPressed: ()=>Get.to(ProfileScreen()), icon: const Icon(Iconsax.edit,color: TColors.white)),
    );
  }
}