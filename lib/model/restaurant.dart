class Restaurant {
  String id, name, description, pictureId, city;
  double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> object) {
    return Restaurant(
      id : object['id'],
      name : object['name'],
      description : object['description'],
      pictureId : object['pictureId'],
      city : object['city'],
      rating : object['rating'].toDouble(),
    );
  }  
}

