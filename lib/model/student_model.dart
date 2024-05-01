class StudentModel {
  int? id;
  final String name;
  final String phone;
  final String batch;
  final String image;

  StudentModel(
      {required this.name,
      required this.phone,
      required this.batch,
      required this.image,
      this.id});

  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final phone = map['phone'] as String;
    final batch = map['batch'] as String;
    final image = map['image'] as String;

    return StudentModel(
      id: id,
      name: name,
      phone: phone,
      batch: batch,
      image: image,
    );
  }
}
