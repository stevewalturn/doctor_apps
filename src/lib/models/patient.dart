class Patient {
  final int? id;
  final String name;
  final int age;
  final String gender;
  final String phone;
  final String address;
  final String medicalHistory;

  Patient({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.phone,
    required this.address,
    required this.medicalHistory,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] as int?,
      name: json['name'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      medicalHistory: json['medicalHistory'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'phone': phone,
      'address': address,
      'medicalHistory': medicalHistory,
    };
  }

  Patient copyWith({
    int? id,
    String? name,
    int? age,
    String? gender,
    String? phone,
    String? address,
    String? medicalHistory,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      medicalHistory: medicalHistory ?? this.medicalHistory,
    );
  }
}
