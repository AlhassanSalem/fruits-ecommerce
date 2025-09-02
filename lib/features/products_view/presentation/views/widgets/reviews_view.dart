import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/entities/review_entity.dart';
import 'package:ecommerce_fruits/core/helper/constants.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key, required this.reviews});
  final List<ReviewEntity> reviews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customAppBar(context, title: LocaleKeys.reviews),
                  ReviewTextField(),
                  SizedBox(height: 16),
                  Text(
                    '${reviews.length} ${LocaleKeys.reviews.tr()}',
                    style: TextStyles.bold13.copyWith(color: AppColors.grey950),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ReviewCard(review: reviews[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});
  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(review.image),
              ),
              PositionedDirectional(
                bottom: 0,
                end: 10,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFC529),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFFC529),
                        blurRadius: 14,
                        offset: Offset(0, 7),
                      ),
                    ],
                  ),
                  child: Text(
                    '${review.ratting * 1.0}',
                    style: TextStyles.semiBold16.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          title: Text(review.name),
          subtitle: Text(review.date),
        ),
        SizedBox(height: 18),
        Text(
          review.reviewDescription,
          style: TextStyles.regular13.copyWith(color: AppColors.gray400),
        ),
      ],
    );
  }
}

class ReviewTextField extends StatelessWidget {
  const ReviewTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: LocaleKeys.enterYourReview.tr(),
        hintStyle: TextStyles.regular13.copyWith(color: AppColors.gray400),

        fillColor: Colors.white,
        filled: true,
        border: outlineInputBuilder(),
        focusedBorder: outlineInputBuilder(),
        enabledBorder: outlineInputBuilder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBuilder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFFEEEEEE)),
    );
  }
}
