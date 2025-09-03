import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_fruits/core/widgets/notifications_widget.dart';
import 'package:ecommerce_fruits/features/best_selling/presentation/views/widget/best_selling_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: LocaleKeys.bestSelling.tr(),
        trailing: NotificationsWidget(),
      ),
      body: BestSellingViewBody(),
    );
  }
}
