class AirportBrand {
  final String name;
  final String image;
  final List<AirportProduct> products;
  AirportBrand({required this.name, required this.image, required this.products});
}

class AirportProduct {
  final int id;
  final String image;
  final String name;
  final double price;
  int quantity;

  AirportProduct({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    this.quantity = 0,
  });

  AirportProduct copyWith({int? quantity}) {
    return AirportProduct(
      id: id,
      name: name,
      price: price,
      image: image,
      quantity: quantity ?? this.quantity,
    );
  }
}
