class PopularItems {
  String image;
  int color;
  String name;

  PopularItems(this.image, this.color, this.name);
}

  List<PopularItems>popitem = popdata
    .map((items) => PopularItems(items['image'], items['color'], items['name'])).toList();

  List<dynamic> popdata = [
    {
      "image":"assets/images/beach.png",
      "color": 0xFFFEF1ED,
      "name": 'Beach',
    },
    {
      "image":"assets/images/mountains.png",
      "color": 0xFFEDF6FE,
      "name": 'Mountain',
    },
    {
      "image":"assets/images/lake.png",
      "color": 0xFFFEF6E8,
      "name": 'Lake',
    },
    {
      "image":"assets/images/river.png",
      "color": 0xFFEAF8E8,
      "name": 'River',
    },
  ];