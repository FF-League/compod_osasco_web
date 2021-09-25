import 'package:compod_osasco_web/app/database_page/controller/database_controller.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DatabaseView extends GetView<DatabaseController> {
  final DatabaseController controller = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: Center(
        child: Column(
          children: [
            Container(height: 64.0, child: Text('Dashboard', style: GoogleFonts.palanquinDark(fontSize: 32.0, color: Colors.white))),
            Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 5.0)],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                constraints: BoxConstraints(
                  maxWidth: 820.0,
                  maxHeight: context.height - 128.0,
                ),
                margin: EdgeInsets.all(32.0),
                padding: EdgeInsets.all(12.0),
                child: Obx(() => ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (BuildContext context, index) => FormsItemWidget(item: controller.list[index], color: index % 2 == 0 ? Colors.blue.shade300 : Colors.blue.shade500)))),
          ],
        ),
      ),
    );
  }
}
