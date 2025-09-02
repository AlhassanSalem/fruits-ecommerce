import 'package:ecommerce_fruits/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity implements Equatable {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;
  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.reviews,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    required this.isFeatured,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [name, code];

  @override
  bool? get stringify => true;
}
