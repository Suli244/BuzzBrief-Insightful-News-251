class NewsModel {
  final String category;
  final String read;
  final String ago;
  final String image;
  final String title;
  final String description;

  NewsModel({
    required this.category,
    required this.read,
    required this.ago,
    required this.image,
    required this.title,
    required this.description,
  });

  factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
        category: json["category"] ?? '',
        read: json["read"] ?? '',
        ago: json["ago"] ?? '',
        image: json["image"] ?? 'https://i.ibb.co/DRNq9c1/1.png',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "category": category,
        "read": read,
        "ago": ago,
        "image": image,
        "title": title,
        "description": description,
      };
}
