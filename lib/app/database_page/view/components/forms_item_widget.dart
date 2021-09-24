import 'package:compod_osasco_web/app/database_page/controller/database_controller.dart';
import 'package:compod_osasco_web/app/database_page/model/form_item_model.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_arrow.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_description.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_label.dart';
import 'package:compod_osasco_web/app/database_page/view/components/forms_item_widget_components/forms_item_widget_shell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormsItemWidget extends StatefulWidget {
  FormsItemWidget({required this.color, required this.item, Key? key}) : super(key: key);

  final Color color;
  final FormItemModel item;
  static const _height = 64.0;
  static const _textHeight = 400.0;

  @override
  _FormsItemWidgetState createState() => _FormsItemWidgetState();
}

class _FormsItemWidgetState extends State<FormsItemWidget> {
  final DatabaseController controller = Get.find();

  var isOpen = false;
  final _padding = 12.0;
  final _duration = Duration(milliseconds: 300);

  void onPressed() {
    isOpen = !isOpen;
    controller.onClick(widget.item.id);
  }

  @override
  Widget build(BuildContext context) {
    return FormsItemWidgetShell(
      color: widget.color,
      child: MaterialButton(
        onPressed: onPressed,
        child: AnimatedContainer(
          duration: _duration,
          padding: EdgeInsets.symmetric(vertical: _padding),
          height: FormsItemWidget._height + (isOpen ? FormsItemWidget._textHeight : 0),
          child: Column(
            children: [
              AnimatedContainer(
                height: 40.0 ,
                padding: EdgeInsets.all(_padding),
                duration: _duration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormsItemWidgetLabel(viewed: widget.item.viewed, text: widget.item.receivedDate, size: 100.0),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FormsItemWidgetLabel(viewed: widget.item.viewed, text: widget.item.name),
                          FormsItemWidgetLabel(viewed: widget.item.viewed, text: widget.item.email),
                          FormsItemWidgetLabel(viewed: widget.item.viewed, text: widget.item.treatment),
                        ],
                      ),
                    ),
                    FormsItemWidgetArrow(isOpen: isOpen)
                  ],
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
