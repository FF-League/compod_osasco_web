
class FormItemModel {
  String id = '';
  bool viewed = false;
  String address = '';
  String email = '';
  String job = '';
  String name = '';
  String sex = '';
  String treatment = '';
  String text = '';
  DateTime birthdate = DateTime.now();

  toMap() => {
        'id': id,
        'viewed': viewed,
        'address': address,
        'email': email,
        'job': job,
        'name': name,
        'sex': sex,
        'text': text,
        'treatment': treatment,
        'birthdate': birthdate.toString(),
      };

  FormItemModel.fromJson(Map<String, dynamic> json, String id)
      : id = id,
        address = json['address'] ?? '',
        email = json['email'] ?? '',
        job = json['job'] ?? '',
        name = json['name'] ?? '',
        sex = json['sex'] ?? '',
        text = json['text'] ?? '',
        treatment = json['treatment'] ?? '',
        birthdate = json['birthdate'] != null ? DateTime.parse(json['birthdate']) : DateTime.now(),
        viewed = json['viewed'] ?? false;
}
