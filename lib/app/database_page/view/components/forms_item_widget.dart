import 'package:compod_osasco_web/app/database_page/controller/database_controller.dart';
import 'package:compod_osasco_web/app/database_page/model/form_item_model.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_arrow.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_description.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_label.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_shell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormsItemWidget extends StatefulWidget {
  const FormsItemWidget({required this.color, required this.item, Key? key}) : super(key: key);

  final Color color;
  final FormItemModel item;
  static const height = 64.0;
  static const textHeight = 400.0;

  @override
  _FormsItemWidgetState createState() => _FormsItemWidgetState();
}

class _FormsItemWidgetState extends State<FormsItemWidget> {
  final DatabaseController controller = Get.find();

  var isOpen = false;
  static const _padding = 12.0;
  static const _duration = Duration(milliseconds: 300);

  void onPressed() {
    isOpen = !isOpen;
    controller.onClick(widget.item.id);
  }

  @override
  Widget build(BuildContext context) {
    return FormsItemWidgetShell(
      color: widget.item.viewed ? widget.color : Colors.greenAccent,
      child: MaterialButton(
        onPressed: onPressed,
        child: AnimatedContainer(
          duration: _duration,
          padding: EdgeInsets.symmetric(vertical: _padding),
          height: isOpen ? FormsItemWidget.textHeight : 0 + FormsItemWidget.height,
          child: Column(
            children: [
              AnimatedContainer(
                height: FormsItemWidget.height - 24.0,
                duration: _duration,
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FormsItemWidgetLabel(viewed: widget.item.viewed, text: widget.item.receivedDate, size: 100.0),
                      FormsItemWidgetLabel(viewed: widget.item.viewed, text: widget.item.name),
                      FormsItemWidgetLabel(viewed: widget.item.viewed, text: widget.item.email),
                      FormsItemWidgetLabel(viewed: widget.item.viewed, text: widget.item.treatment),
                      FormsItemWidgetArrow(isOpen: isOpen)
                    ],
                  ),
                ),
              ),
              Expanded(child: FormsItemWidgetDescription(isOpen: isOpen, content: widget.item))
            ],
          ),
        ),
      ),
    );
  }
}
