import 'package:get_storage/get_storage.dart';

class Storage {

  static var box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static void write(String key, dynamic value) => box.write(key, value);
  static dynamic read(String key, dynamic value) => box.read(key);

  static void saveToken(dynamic token) => write('token', token);


}