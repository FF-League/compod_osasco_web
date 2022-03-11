import 'package:compod_osasco_web/app/database_page/controller/database_controller.dart';
import 'package:compod_osasco_web/app/database_page/model/form_type.dart';
import 'package:compod_osasco_web/app/database_page/view/components/hospitalization_forms_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalizationPage extends GetView<DatabaseController> {
  const HospitalizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 5.0)],
        borderRadius: BorderRadius.circular(8.0),
      ),
      constraints: BoxConstraints(maxWidth: 820.0),
      margin: EdgeInsets.all(32.0),
      padding: EdgeInsets.all(12.0),
      child: Obx(() => ListView.builder(
            itemCount: controller.hospitalizationItems.length,
            itemBuilder: (context, index) => HospitalizationFormsItemWidget(
              item: controller.hospitalizationList[index],
              color: index % 2 == 0 ? Colors.blue.shade300 : Colors.blue.shade500,
              formType: FormType.hospitalization,
            ),
          )),
    );
  }
}
