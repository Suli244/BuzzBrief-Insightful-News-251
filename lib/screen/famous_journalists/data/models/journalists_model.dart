import 'dart:convert';

class JournalistsMode {
  final String bio;
  final String image;
  final String name;
  JournalistsMode({
    required this.bio,
    required this.image,
    required this.name,
  });

  JournalistsMode copyWith({
    String? bio,
    String? image,
    String? name,
  }) {
    return JournalistsMode(
      bio: bio ?? this.bio,
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'bio': bio});
    result.addAll({'image': image});
    result.addAll({'name': name});

    return result;
  }

  factory JournalistsMode.fromJson(Map<String, dynamic> map) {
    return JournalistsMode(
      bio: map['bio'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'JournalistsMode(bio: $bio, image: $image, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JournalistsMode &&
        other.bio == bio &&
        other.image == image &&
        other.name == name;
  }

  @override
  int get hashCode => bio.hashCode ^ image.hashCode ^ name.hashCode;

  factory JournalistsMode.fromMap(Map<String, dynamic> map) {
    return JournalistsMode(
      bio: map['bio'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
