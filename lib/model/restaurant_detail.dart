import 'package:restaurants_app/model/customer_review.dart';
import 'package:restaurants_app/model/menus.dart';

class RestaurantDetail {
  String id, name, description, city, address, pictureId;
  double rating;
  Menus menus;
  List<String> categories;
  List<CustomerReview> customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
    });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) => RestaurantDetail(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    city: json["city"],
    address: json["address"],
    pictureId: json["pictureId"],
    categories: List<String>.from(json["categories"].map((category) => category['name'])),
    menus: Menus.fromJson(json["menus"]),
    rating: json["rating"].toDouble(),
    customerReviews: List<CustomerReview>
      .from(json["customerReviews"]
      .map((review) => CustomerReview.fromJson(review))),
    );

}

