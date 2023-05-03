class RecommendedItems {
  String name;
  String image;

  RecommendedItems(this.name, this.image);
}

  List<RecommendedItems> recommendations = recommendedData.map((item) => RecommendedItems(item['name']!, item['image']!)).toList();

  var recommendedData = [
    {
      "name": "some landscape, Indonesia",
      "image": "https://images.pexels.com/photos/1743165/pexels-photo-1743165.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    },
     {
      "name": "some landscape, Indonesia",
      "image": "https://images.pexels.com/photos/1646870/pexels-photo-1646870.jpeg?auto=compress&cs=tinysrgb&w=600",
    },
    {
      "name": "some landscape, Indonesia",
      "image": "https://images.pexels.com/photos/931007/pexels-photo-931007.jpeg?auto=compress&cs=tinysrgb&w=600",
    },
    {
      "name": "some landscape, Indonesia",
      "image": "https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg?auto=compress&cs=tinysrgb&w=600",
    },
     {
      "name": "some landscape, Indonesia",
      "image": "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&w=600",
    },
  ];
