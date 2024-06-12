import 'dart:convert';

class PokemonInfo {
  String? name;
  int? height;
  int? weight;
  List<TypeElement>? types;
  String? imageUrl;
  PokemonInfo({
    this.name,
    this.height,
    this.weight,
    this.types,
    this.imageUrl,
  });

  PokemonInfo copyWith({
    String? name,
    int? height,
    int? weight,
    List<TypeElement>? types,
    String? imageUrl,
  }) {
    return PokemonInfo(
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      types: types ?? this.types,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (height != null) {
      result.addAll({'height': height});
    }
    if (weight != null) {
      result.addAll({'weight': weight});
    }
    if (types != null) {
      result.addAll({'types': types!.map((x) => x.toMap()).toList()});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }

    return result;
  }

  factory PokemonInfo.fromMap(Map<String, dynamic> map) {
    return PokemonInfo(
      name: map['name'],
      height: map['height']?.toInt(),
      weight: map['weight']?.toInt(),
      types: map['types'] != null
          ? List<TypeElement>.from(
              map['types']?.map((x) => TypeElement.fromMap(x)))
          : null,
      imageUrl: map['sprites']['back_default'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonInfo.fromJson(String source) =>
      PokemonInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonInfo(name: $name, height: $height, weight: $weight, types: $types, imageUrl: $imageUrl)';
  }
}

class TypeElement {
  int? slot;
  TypeType? type;
  TypeElement({
    this.slot,
    this.type,
  });

  TypeElement copyWith({
    int? slot,
    TypeType? type,
  }) {
    return TypeElement(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (slot != null) {
      result.addAll({'slot': slot});
    }
    if (type != null) {
      result.addAll({'type': type!.toMap()});
    }

    return result;
  }

  factory TypeElement.fromMap(Map<String, dynamic> map) {
    return TypeElement(
      slot: map['slot']?.toInt(),
      type: map['type'] != null ? TypeType.fromMap(map['type']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeElement.fromJson(String source) =>
      TypeElement.fromMap(json.decode(source));

  @override
  String toString() => 'TypeElement(slot: $slot, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeElement && other.slot == slot && other.type == type;
  }

  @override
  int get hashCode => slot.hashCode ^ type.hashCode;
}

class TypeType {
  String? name;
  String? url;
  TypeType({
    this.name,
    this.url,
  });

  TypeType copyWith({
    String? name,
    String? url,
  }) {
    return TypeType(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (url != null) {
      result.addAll({'url': url});
    }

    return result;
  }

  factory TypeType.fromMap(Map<String, dynamic> map) {
    return TypeType(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeType.fromJson(String source) =>
      TypeType.fromMap(json.decode(source));

  @override
  String toString() => 'TypeType(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeType && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
