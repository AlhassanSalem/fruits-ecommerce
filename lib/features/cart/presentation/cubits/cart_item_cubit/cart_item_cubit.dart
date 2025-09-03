import 'dart:developer';

import 'package:ecommerce_fruits/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity cartItem) {
    log(cartItem.toString());
    emit(CartItemUpdated(cartItem));
  }
}
