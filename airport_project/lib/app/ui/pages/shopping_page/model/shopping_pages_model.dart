class Category {
  final String name;
  final List<Brand> brands;

  Category({required this.name, required this.brands});
}

class Brand {
  final String name;
  final String location;

  Brand({required this.name, required this.location});
}