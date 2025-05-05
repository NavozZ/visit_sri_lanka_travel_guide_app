class Booking {
  final String id;
  final String userId;
  final String tourId;
  final String tourTitle;
  final DateTime bookingDate;
  final String priceType;
  final dynamic price; // Can be int or double
  final DateTime createdAt;

  Booking({
    required this.id,
    required this.userId,
    required this.tourId,
    required this.tourTitle,
    required this.bookingDate,
    required this.priceType,
    required this.price,
    required this.createdAt,
  });

  // Convert Booking to Firestore map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'tourId': tourId,
      'tourTitle': tourTitle,
      'bookingDate': bookingDate.toIso8601String(),
      'priceType': priceType,
      'price': price,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create Booking from Firestore map
  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      tourId: map['tourId'] ?? '',
      tourTitle: map['tourTitle'] ?? '',
      bookingDate: DateTime.parse(map['bookingDate']),
      priceType: map['priceType'] ?? '',
      price: map['price'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  // Copy with method for updating data
  Booking copyWith({
    String? id,
    String? userId,
    String? tourId,
    String? tourTitle,
    DateTime? bookingDate,
    String? priceType,
    dynamic price,
    DateTime? createdAt,
  }) {
    return Booking(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      tourId: tourId ?? this.tourId,
      tourTitle: tourTitle ?? this.tourTitle,
      bookingDate: bookingDate ?? this.bookingDate,
      priceType: priceType ?? this.priceType,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
