import 'package:compod_osasco_web/app/database_page/controller/database_controller.dart';
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
            SizedBox(height: 64.0, child: Text('Dashboard', style: GoogleFonts.palanquinDark(fontSize: 32.0, color: Colors.white))),
            TabBar(
              tabs: [
                Tab(text: 'Internação'),
                Tab(text: 'Voluntários'),
              ],
              controller: controller.tabController,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [controller.hospPage, controller.voluPage],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
