class TaharatModel {
  final String title;
  final String description;
  final List<String> images;
  final String section;

  TaharatModel({
    this.title,
    this.description,
    this.images,
    this.section,
  });

  factory TaharatModel.fromJson(Map<String, dynamic> jsonData) {
    // Images
    List<String> images = [];
    try {
      if (jsonData['images'] != null && jsonData['images'].length > 0) {
        for (dynamic i in jsonData['images']) {
          images.add(i['path']);
          print(i);
        }
      }
    } catch (e) {
      print(e);
    }

    return TaharatModel(
      title: jsonData['title'],
      description: jsonData['description'],
      images: images,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = Map<String, dynamic>();

    result['title'] = this.title;
    result['description'] = this.description;

    return result;
  }
}
