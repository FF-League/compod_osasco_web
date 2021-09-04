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
  final _duration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return FormsItemWidgetShell(
      color: widget.color,
      child: MaterialButton(
        onPressed: () {
          isOpen = !isOpen;
          controller.onClick(widget.item.id);
        },
        child: AnimatedContainer(
          duration: _duration,
          padding: EdgeInsets.only(top: _padding, bottom: isOpen ? 0.0 : _padding),
          height: FormsItemWidget._height + (isOpen ? FormsItemWidget._textHeight : 0),
          child: Column(
            children: [
              AnimatedContainer(
                height: 40.0 + (isOpen ? _padding : 0),
                padding: EdgeInsets.symmetric(horizontal: _padding),
                duration: _duration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FormsItemWidgetLabel(text: widget.item.birthdate.toString()),
                        FormsItemWidgetLabel(text: widget.item.name),
                        FormsItemWidgetLabel(text: widget.item.email),
                        FormsItemWidgetLabel(text: widget.item.treatment),
                      ],
                    ),
                    FormsItemWidgetArrow(isOpen: isOpen)
                  ],
                ),
              ),
              Expanded(child: FormsItemWidgetDescription(duration: _duration, isOpen: isOpen, height: FormsItemWidget._textHeight, content: widget.item.text))
            ],
          ),
        ),
      ),
    );
  }
}
