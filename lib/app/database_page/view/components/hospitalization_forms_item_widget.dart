import 'package:compod_osasco_web/app/database_page/controller/database_controller.dart';
import 'package:compod_osasco_web/app/database_page/model/form_type.dart';
import 'package:compod_osasco_web/app/database_page/model/hospitalization_form_item_model.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_arrow.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/hospitalization_forms_item_widget_description.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_label.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_shell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalizationFormsItemWidget extends StatefulWidget {
  const HospitalizationFormsItemWidget({required this.color, required this.item, Key? key, required this.formType}) : super(key: key);

  final FormType formType;
  final Color color;
  final HospitalizationFormItemModel item;
  static const height = 64.0;
  static const textHeight = 400.0;

  @override
  _HospitalizationFormsItemWidgetState createState() => _HospitalizationFormsItemWidgetState();
}

class _HospitalizationFormsItemWidgetState extends State<HospitalizationFormsItemWidget> {
  final DatabaseController controller = Get.find();

  var isOpen = false;
  static const _padding = 12.0;
  static const _duration = Duration(milliseconds: 200);

  void onPressed() {
    isOpen = !isOpen;
    controller.onClick(widget.item.id, widget.formType);
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
          height: isOpen ? HospitalizationFormsItemWidget.textHeight : 0 + HospitalizationFormsItemWidget.height,
          child: Column(
            children: [
              AnimatedContainer(
                height: HospitalizationFormsItemWidget.height - 24.0,
                duration: _duration,
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
              HospitalizationFormsItemWidgetDescription(isOpen: isOpen, content: widget.item)
            ],
          ),
        ),
      ),
    );
  }
}
