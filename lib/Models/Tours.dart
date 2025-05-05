class Tours {
  String? id; // Add ID field
  String? title;
  String? mainimage;
  Map<String, dynamic>? prices;
  List<String>? otherImages;
  List<String>? visitingplaces;
  String? description;

  Tours({
    this.id, // Include id in constructor
    this.title,
    this.prices,
    this.mainimage,
    this.otherImages,
    this.visitingplaces,
    this.description,
  });

  // Factory constructor to create a Tours object from Firestore data
  factory Tours.fromSnapshot(Map<String, dynamic> data, String documentId) {
    return Tours(
      id: documentId, // Set the document ID
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

  // Convert Tours object to Map for Firebase storage
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'mainimage': mainimage,
      'other-images': otherImages,
      'visiting-places': visitingplaces,
    };
  }
}
