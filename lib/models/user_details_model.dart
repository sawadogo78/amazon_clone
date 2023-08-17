class UserDetailsModel {
  final String name;
  final String address;
  UserDetailsModel({
    required this.name,
    required this.address,
  });

  UserDetailsModel copyWith({
    String? name,
    String? address,
  }) {
    return UserDetailsModel(
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
    };
  }

  factory UserDetailsModel.fromJson(Map<String, dynamic> map) {
    return UserDetailsModel(
      name: map['name'] as String,
      address: map['address'] as String,
    );
  }

  @override
  bool operator ==(covariant UserDetailsModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.address == address;
  }

  @override
  int get hashCode => name.hashCode ^ address.hashCode;
}
