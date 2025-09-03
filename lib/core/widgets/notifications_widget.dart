import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFFEEF8ED),
      child: SvgPicture.asset(
        Assets.imagesNotifications,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}