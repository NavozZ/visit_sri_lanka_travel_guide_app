class Places {
  String? title;
  String? mainimage;
  String? description;
  String? moreinformation;
  List<String>? otherImages;
  double? latitude;
  double? longitude;

  Places({
    this.title,
    this.description,
    this.mainimage,
    this.otherImages,
    this.moreinformation,
    this.latitude,
    this.longitude,
  });

  factory Places.fromSnapshot(Map<String, dynamic> data) {
    return Places(
      title: data['title'] ?? '',
      mainimage: data['main-image'] ?? '',
      description: data['description'] ?? '',
      moreinformation: data['more-information'] ?? '',
      otherImages: data.containsKey('other-images')
          ? List<String>.from(data['other-images'])
          : [],
    );
  }
}
