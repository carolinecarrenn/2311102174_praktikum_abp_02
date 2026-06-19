import 'package:equatable/equatable.dart';
import '../models/product.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

// Event untuk menambahkan produk ke keranjang
class AddToCart extends CartEvent {
  final Product product;

  const AddToCart(this.product);

  @override
  List<Object?> get props => [product];
}

// Event untuk menghapus produk dari keranjang
class RemoveFromCart extends CartEvent {
  final String productId;

  const RemoveFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

// Event untuk mengurangi quantity produk di keranjang
class DecrementQuantity extends CartEvent {
  final String productId;

  const DecrementQuantity(this.productId);

  @override
  List<Object?> get props => [productId];
}

// Event untuk mengosongkan keranjang
class ClearCart extends CartEvent {
  const ClearCart();
}
