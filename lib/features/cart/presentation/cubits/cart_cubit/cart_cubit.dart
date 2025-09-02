import 'package:ecommerce_fruits/core/entities/product_entity.dart';
import 'package:ecommerce_fruits/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_fruits/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartItems = CartEntity(cartItems: []);

  void addProductToCart(ProductEntity product) {
    bool isProductExists = cartItems.isProductExists(product);
    CartItemEntity cartItemEntity = cartItems.getCartItem(product);
    if (isProductExists) {
      cartItemEntity.increaseQuantity();
    } else {
      cartItems.cartItems.add(cartItemEntity);
    }
    emit(CartProductAdded());
  }

  void removeProductFromCart(CartItemEntity cartItemEntity) {
    cartItems.removeProduct(cartItemEntity);

    emit(CartProductRemoved());
  }
}
