// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReviewModel {
  final String senderName;
  final String description;
  final int rating;
  ReviewModel({
    required this.senderName,
    required this.description,
    required this.rating,
  });

  ReviewModel copyWith({
    String? senderName,
    String? description,
    int? rating,
  }) {
    return ReviewModel(
      senderName: senderName ?? this.senderName,
      description: description ?? this.description,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sender': senderName,
      'description': description,
      'rating': rating,
    };
  }

  factory ReviewModel.fromJson(Map<String, dynamic> map) {
    return ReviewModel(
      senderName: map['sender'],
      description: map['description'],
      rating: map['rating'],
    );
  }
}
