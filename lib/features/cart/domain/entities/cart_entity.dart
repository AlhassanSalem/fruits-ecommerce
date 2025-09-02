import 'package:ecommerce_fruits/core/entities/product_entity.dart';
import 'package:ecommerce_fruits/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  bool isProductExists(ProductEntity product) {
    return cartItems.any((item) => item.product == product);
  }

  CartItemEntity getCartItem(ProductEntity product) {
    return cartItems.firstWhere(
      (item) => item.product == product,
      orElse: () => CartItemEntity(product: product, quantity: 1),
    );
  }

  num get totalPrice {
    return cartItems.fold(
      0,
      (total, item) => total + item.calculateTotalPrice(),
    );
  }

  void removeProduct(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }
}
