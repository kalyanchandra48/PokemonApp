import 'dart:convert';

import 'package:flutter/foundation.dart';

class PokemonListModel {
  int? count;
  String? next;
  dynamic previous;
  List<PokeMonModel>? results;
  PokemonListModel({
    this.count,
    this.next,
    required this.previous,
    this.results,
  });

  PokemonListModel copyWith({
    int? count,
    String? next,
    dynamic previous,
    List<PokeMonModel>? results,
  }) {
    return PokemonListModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (count != null) {
      result.addAll({'count': count});
    }
    if (next != null) {
      result.addAll({'next': next});
    }
    result.addAll({'previous': previous});
    if (results != null) {
      result.addAll({'results': results!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory PokemonListModel.fromMap(Map<String, dynamic> map) {
    return PokemonListModel(
      count: map['count']?.toInt(),
      next: map['next'],
      previous: map['previous'],
      results: map['results'] != null
          ? List<PokeMonModel>.from(map['results']?.map((x) => PokeMonModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonListModel.fromJson(String source) =>
      PokemonListModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonListModel(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonListModel &&
        other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}

class PokeMonModel {
  String? name;
  String? url;
  PokeMonModel({
    this.name,
    this.url,
  });

  PokeMonModel copyWith({
    String? name,
    String? url,
  }) {
    return PokeMonModel(
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

  factory PokeMonModel.fromMap(Map<String, dynamic> map) {
    return PokeMonModel(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokeMonModel.fromJson(String source) => PokeMonModel.fromMap(json.decode(source));

  @override
  String toString() => 'Result(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokeMonModel && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
