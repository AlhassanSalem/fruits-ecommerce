import 'package:ecommerce_fruits/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Dummy Fruit',
    description: 'This is a dummy fruit for testing purposes.',
    price: 9.99,
    imageUrl: 'https://via.placeholder.com/150',
    code: 'DUMMY_FRUIT',
    isFeatured: false,
    expirationsMonths: 6,
    isOrganic: true,
    numberOfCalories: 50,
    unitAmount: 1,
    reviews: [],
  );
}

List<ProductEntity> getDummyProductList() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
