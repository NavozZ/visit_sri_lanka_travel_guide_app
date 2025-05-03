class Tours {
  String? title;
  String? mainimage;
  Map<String, dynamic>? prices;
  List<String>? otherImages;
  List<String>? visitingplaces;
  String? description;

  Tours({
    this.title,
    this.prices,
    this.mainimage,
    this.otherImages,
    this.visitingplaces,
    this.description,
  });

  factory Tours.fromSnapshot(Map<String, dynamic> data) {
    return Tours(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      mainimage: data['mainimage'] ?? '',
      otherImages: data.containsKey('other-images')
          ? List<String>.from(data['other-images'])
          : [],
      visitingplaces: data.containsKey('visiting-places')
          ? List<String>.from(data['visiting-places'])
          : [],
    );
  }
}
