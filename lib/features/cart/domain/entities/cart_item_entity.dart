import 'package:ecommerce_fruits/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity implements Equatable {
  final ProductEntity product;
  int quantity;

  CartItemEntity({required this.product, required this.quantity});

  num calculateTotalPrice() {
    return product.price * quantity;
  }

  num calculateTotalWeight() {
    return product.unitAmount * quantity;
  }

  increaseQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    quantity--;
  }

  @override
  List<Object?> get props => [product];

  @override
  bool? get stringify => true;

  removeFromCart() {
    quantity = 0;
  }
}
