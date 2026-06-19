import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/cart_item.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<DecrementQuantity>(_onDecrementQuantity);
    on<ClearCart>(_onClearCart);
  }

  // Handler untuk menambahkan produk ke keranjang
  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final existingItemIndex = state.items.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (existingItemIndex >= 0) {
      // Jika produk sudah ada, tambahkan quantity
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingItemIndex] = CartItem(
        product: event.product,
        quantity: updatedItems[existingItemIndex].quantity + 1,
      );
      emit(state.copyWith(items: updatedItems));
    } else {
      // Jika produk belum ada, tambahkan item baru
      emit(state.copyWith(
        items: [...state.items, CartItem(product: event.product, quantity: 1)],
      ));
    }
  }

  // Handler untuk menghapus produk dari keranjang
  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final updatedItems = state.items
        .where((item) => item.product.id != event.productId)
        .toList();
    emit(state.copyWith(items: updatedItems));
  }

  // Handler untuk mengurangi quantity produk
  void _onDecrementQuantity(DecrementQuantity event, Emitter<CartState> emit) {
    final existingItemIndex = state.items.indexWhere(
      (item) => item.product.id == event.productId,
    );

    if (existingItemIndex >= 0) {
      final currentQuantity = state.items[existingItemIndex].quantity;

      if (currentQuantity <= 1) {
        // Jika quantity 1, hapus produk dari keranjang
        final updatedItems = state.items
            .where((item) => item.product.id != event.productId)
            .toList();
        emit(state.copyWith(items: updatedItems));
      } else {
        // Kurangi quantity
        final updatedItems = List<CartItem>.from(state.items);
        updatedItems[existingItemIndex] = CartItem(
          product: state.items[existingItemIndex].product,
          quantity: currentQuantity - 1,
        );
        emit(state.copyWith(items: updatedItems));
      }
    }
  }

  // Handler untuk mengosongkan keranjang
  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(const CartState());
  }
}
