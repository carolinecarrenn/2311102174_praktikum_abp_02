import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final double price;
  final String image;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  @override
  List<Object?> get props => [id, name, price, image, description];

  // Sample products data
  static List<Product> getSampleProducts() {
    return [
      const Product(
        id: '1',
        name: 'Laptop ASUS ROG',
        price: 15000000,
        image: '💻',
        description: 'Laptop gaming dengan performa tinggi',
      ),
      const Product(
        id: '2',
        name: 'Smartphone Samsung Galaxy',
        price: 8000000,
        image: '📱',
        description: 'Smartphone flagship dengan kamera terbaik',
      ),
      const Product(
        id: '3',
        name: 'Headphone Sony WH-1000XM5',
        price: 4500000,
        image: '🎧',
        description: 'Headphone noise-cancelling premium',
      ),
      const Product(
        id: '4',
        name: 'Smartwatch Apple Watch',
        price: 7000000,
        image: '⌚',
        description: 'Smartwatch dengan fitur kesehatan lengkap',
      ),
      const Product(
        id: '5',
        name: 'Tablet iPad Pro',
        price: 12000000,
        image: '📲',
        description: 'Tablet untuk produktivitas dan kreatif',
      ),
      const Product(
        id: '6',
        name: 'Kamera DSLR Canon EOS',
        price: 18000000,
        image: '📷',
        description: 'Kamera profesional untuk fotografi',
      ),
      const Product(
        id: '7',
        name: 'Keyboard Mechanical',
        price: 2500000,
        image: '⌨️',
        description: 'Keyboard gaming dengan switch Cherry MX',
      ),
      const Product(
        id: '8',
        name: 'Mouse Gaming Razer',
        price: 1500000,
        image: '🖱️',
        description: 'Mouse gaming presisi tinggi',
      ),
    ];
  }
}
