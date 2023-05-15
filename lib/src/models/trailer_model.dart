class TrailerModel {
  final int id;
  final List<Result> results;

  TrailerModel({
    required this.id,
    required this.results,
  });

  factory TrailerModel.fromJson(Map json) {
    return TrailerModel(
      id: json["id"],
      results:
          (json['results'] as List).map((e) => Result.fromJson(e)).toList(),
    );
  }
}

class Result {
  final String id;
  final String iso6391;
  final String iso31661;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;

  Result({
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
  });

  factory Result.fromJson(Map json) {
    return Result(
      id: json['id'],
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      key: json['key'],
      name: json['name'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
    );
  }
}
