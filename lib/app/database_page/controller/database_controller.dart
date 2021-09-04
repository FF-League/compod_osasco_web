import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compod_osasco_web/app/database_page/model/form_item_model.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  RxList<FormItemModel> items = <FormItemModel>[].obs;

  final collection = FirebaseFirestore.instance.collection('forms');

  Future<void> onClick(String id) async {
    final item = items.firstWhere((element) => element.id == id);
    items.remove(item);
    item.viewed = true;
    items.add(item);
    await collection.doc(id.toString()).set(item.toMap());
  }


  @override
  void onReady() {
    fetchData();
  }

  void fetchData() async {
    items.clear();
    collection.snapshots().forEach((element) {
      final item = element.docs.first;
      items.add(FormItemModel.fromJson(item.data(), item.id));
    });
  }
}
