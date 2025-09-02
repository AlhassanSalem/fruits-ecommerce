import 'package:ecommerce_fruits/core/functions/get_user.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/core/widgets/notifications_widget.dart';
import 'package:ecommerce_fruits/features/auth/domain/entites/user_entity.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity user = userData;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(Assets.imagesAvater),
      ),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: Color(0xFF949D9E)),
      ),
      subtitle: Text(user.name, style: TextStyles.bold16),
      trailing: NotificationsWidget(),
    );
  }
}


