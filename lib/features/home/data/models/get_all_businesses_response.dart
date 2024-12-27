import 'package:json_annotation/json_annotation.dart';

part 'get_all_businesses_response.g.dart';

@JsonSerializable()
class GetAllBusinessesResponse {
  final String id;
  final String name;
  final String description;
  final String location;
  final String mainImage;
  final List<String> images;
  final List<Rooms> rooms;
  final List<Reviews> reviews;

  GetAllBusinessesResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.mainImage,
    required this.images,
    required this.rooms,
    required this.reviews,
  });

  factory GetAllBusinessesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllBusinessesResponseFromJson(json);
}

@JsonSerializable()
class Rooms {
  final String id;
  final String name;
  final List<String> images;
  final String type;
  final int capacity;
  final int level;
  final String duration;
  final String openTime;
  final String closeTime;
  final int difficulty;
  final int pricePerPerson;

  Rooms({
    required this.id,
    required this.name,
    required this.images,
    required this.type,
    required this.capacity,
    required this.level,
    required this.duration,
    required this.openTime,
    required this.closeTime,
    required this.difficulty,
    required this.pricePerPerson,
  });

  factory Rooms.fromJson(Map<String, dynamic> json) => _$RoomsFromJson(json);
}
@JsonSerializable()
class Reviews {
  final String username;
  final int rating;
  final String comment;

  Reviews({
    required this.username,
    required this.rating,
    required this.comment,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => _$ReviewsFromJson(json);
}