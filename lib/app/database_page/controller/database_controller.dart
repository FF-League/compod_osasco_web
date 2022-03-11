import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compod_osasco_web/app/commons/routes.dart';
import 'package:compod_osasco_web/app/commons/storage.dart';
import 'package:compod_osasco_web/app/database_page/model/form_type.dart';
import 'package:compod_osasco_web/app/database_page/model/hospitalization_form_item_model.dart';
import 'package:compod_osasco_web/app/database_page/model/voluntary_form_item_model.dart';
import 'package:compod_osasco_web/app/database_page/view/pages/hospitalization_page.dart';
import 'package:compod_osasco_web/app/database_page/view/pages/voluntary_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController with GetSingleTickerProviderStateMixin {
  final hospitalizationItems = <String, HospitalizationFormItemModel>{}.obs;
  final voluntaryItems = <String, VoluntaryFormItemModel>{}.obs;

  List<HospitalizationFormItemModel> get hospitalizationList => hospitalizationItems.values.toList(growable: false)..sort((a, b) => b.receivedDate.compareTo(a.receivedDate));
  List<VoluntaryFormItemModel> get voluntaryList => voluntaryItems.values.toList(growable: false)..sort((a, b) => b.receivedDate.compareTo(a.receivedDate));

  late final TabController tabController;
  final collection = FirebaseFirestore.instance.collection('forms');
  final voluntaryCollection = FirebaseFirestore.instance.collection('voluntary');

  final hospPage = HospitalizationPage();
  final voluPage = VoluntaryPage();

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  Future<void> onClickVoluntary(String id) async {
    var item = voluntaryItems[id];
    if (item != null) {
      if (item.viewed == false) {
        item.viewed = true;
        await voluntaryCollection.doc(id.toString()).set(item.toMap());
      }
      refresh();
    }
  }

  Future<void> onClickHospitalization(String id) async {
    var item = hospitalizationItems[id];
    if (item != null) {
      if (item.viewed == false) {
        item.viewed = true;
        await collection.doc(id.toString()).set(item.toMap());
      }
      refresh();
    }
  }
  Future<void> onClick(String id, FormType formType) async {
    if (formType == FormType.hospitalization) {
      await onClickHospitalization(id);
    } else {
      await onClickVoluntary(id);
    }
  }

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  @override
  void refresh() {
    fetchData();
    super.refresh();
  }

  void fetchData() async {
    if (Storage.box.read('token') == null) {
      Get.offAllNamed(Routes.home.route);
    } else {
      collection.get().then((value) => value.docs.forEach((element) => hospitalizationItems[element.id] = HospitalizationFormItemModel.fromJson(element.data(), element.id)));
      voluntaryCollection.get().then((value) => value.docs.forEach((element) => voluntaryItems[element.id] = VoluntaryFormItemModel.fromJson(element.data(), element.id)));
    }
  }

}
