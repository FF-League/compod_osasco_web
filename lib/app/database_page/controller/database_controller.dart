import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compod_osasco_web/app/database_page/model/form_item_model.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  var items = <String, FormItemModel>{}.obs;

  final collection = FirebaseFirestore.instance.collection('forms');

  Future<void> onClick(String id) async {
    var item = items[id];
    if (item != null) {
      if (item.viewed == false) {
        item.viewed = true;
        await collection.doc(id.toString()).set(item.toMap());
      }
      refresh();
    }
  }

  @override
  void onReady() {
    fetchData();
  }

  @override
  void refresh() {
    fetchData();
  }

  void fetchData() async {
    collection.snapshots().forEach((element) {
      final item = element.docs.first;
      items[item.id] = FormItemModel.fromJson(item.data(), item.id);
    });
  }
}
