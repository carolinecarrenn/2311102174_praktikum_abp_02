import 'package:equatable/equatable.dart';
import '../models/cart_item.dart';

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({
    this.items = const [],
  });

  // Menghitung total item di keranjang
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  // Menghitung total harga
  double get totalPrice => items.fold(0, (sum, item) => sum + item.totalPrice);

  // Format harga ke dalam string
  String get formattedTotalPrice => 'Rp ${totalPrice.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]}.',
      )}';

  // Mengecek apakah keranjang kosong
  bool get isEmpty => items.isEmpty;

  // Mengecek apakah produk sudah ada di keranjang
  bool containsProduct(String productId) {
    return items.any((item) => item.product.id == productId);
  }

  // Mendapatkan quantity produk di keranjang
  int getQuantity(String productId) {
    for (final item in items) {
      if (item.product.id == productId) {
        return item.quantity;
      }
    }
    return 0;
  }

  CartState copyWith({
    List<CartItem>? items,
  }) {
    return CartState(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}
