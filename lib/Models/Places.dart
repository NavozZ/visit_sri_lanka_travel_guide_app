class Places {
  String? title;
  String? mainimage;
  String? description;
  String? moreinformation;
  List<String>? otherImages;

  Places(
      {this.title,
      this.description,
      this.mainimage,
      this.otherImages,
      this.moreinformation});

  factory Places.fromSnapshot(Map<String, dynamic> data) {
    return Places(
      title: data['title'] ?? '',
      mainimage: data['mainimage'] ?? '',
      description: data['description'] ?? '',
      moreinformation: data['more-information'] ?? '',
      otherImages: data.containsKey('other-images')
          ? List<String>.from(data['other-images'])
          : [],
    );
  }
}
