class Tours {
  String? title;
  String? mainimage;
  Map<String, dynamic>? prices;
  List<String>? otherImages;

  Tours({
    this.title,
    this.prices,
    this.mainimage,
    this.otherImages,
  });

  factory Tours.fromSnapshot(Map<String, dynamic> data) {
    return Tours(
      title: data['title'] ?? '',
      mainimage: data['mainimage'] ?? '',
      otherImages: data.containsKey('other-images')
          ? List<String>.from(data['other-images'])
          : [],
    );
  }
}
