class Product {
  final String id;
  final String title;
  final String type;
  final List<String> skinTypes;
  final String cosmeticsLine;
  final String effect;
  final String category;
  final double price;
  final String imageUrl;

  Product({required this.id,
    required this.title,
    required this.type,
    required this.skinTypes,
    required this.cosmeticsLine,
    required this.effect,
    required this.category,
    required this.price,
    required this.imageUrl});
}
