
class VoluntaryFormItemModel {
  String id = '';
  bool viewed = false;
  bool isOpen = false;
  String address = '';
  String email = '';
  String job = '';
  String name = '';
  String sex = '';
  String treatment = '';
  String text = '';
  String phone = '';
  int age = 0;
  DateTime receivedDate = DateTime.now();

  toMap() => {
        'id': id,
        'viewed': viewed,
        'address': address,
        'email': email,
        'job': job,
        'name': name,
        'sex': sex,
        'text': text,
        'phone': phone,
        'treatment': treatment,
        'age': age,
        'receivedDate': receivedDate.toString(),
      };

  VoluntaryFormItemModel.fromJson(Map<String, dynamic> json, String id)
      : id = id,
        address = json['address'] ?? '',
        email = json['email'] ?? '',
        job = json['job'] ?? '',
        name = json['name'] ?? '',
        sex = json['sex'] ?? '',
        text = json['text'] ?? '',
        phone = json['phone'] ?? '',
        treatment = json['treatment'] ?? '',
        age = json['age'] ?? 0,
        receivedDate = json['receivedDate'] != null ? DateTime.parse(json['receivedDate']) : DateTime.now(),
        viewed = json['viewed'] ?? false;

  @override
  String toString() {
    return 'FormItemModel{id: $id, viewed: $viewed, address: $address, email: $email, job: $job, name: $name, sex: $sex, treatment: $treatment, text: $text, age: $age, receivedDate: $receivedDate}';
  }
}
