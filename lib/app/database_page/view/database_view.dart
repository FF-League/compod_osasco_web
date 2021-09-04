import 'package:compod_osasco_web/app/database_page/controller/database_controller.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DatabaseView extends GetView {
  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = Get.put(DatabaseController());
    controller.fetchData();
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 5.0)],
              borderRadius: BorderRadius.circular(24.0),
            ),
            constraints: BoxConstraints(
              maxWidth: context.width,
              maxHeight: context.height,
              minHeight: 400,
              minWidth: 600,
            ),
            margin: EdgeInsets.all(32.0),
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Forms', style: GoogleFonts.palanquinDark(fontSize: 32.0)),
                Expanded(
                    child: Obx(() => ListView.builder(
                        itemCount: controller.items.length,
                        itemBuilder: (BuildContext context, index) =>
                            FormsItemWidget(item: controller.items[index], color: index % 2 == 0 ? Colors.blue.shade300 : Colors.blue.shade500 ,))))
              ],
            )),
      ),
    );
  }
}
