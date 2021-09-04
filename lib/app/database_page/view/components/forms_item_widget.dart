import 'package:compod_osasco_web/app/database_page/controller/database_controller.dart';
import 'package:compod_osasco_web/app/database_page/model/form_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormsItemWidget extends StatefulWidget {
  FormsItemWidget({required this.color, required this.item, Key? key})
      : super(key: key);

  final Color color;
  final FormItemModel item;
  static const _height = 64.0;
  static const _textHeight = 400.0;

  @override
  _FormsItemWidgetState createState() => _FormsItemWidgetState();
}

class _FormsItemWidgetState extends State<FormsItemWidget> {
  final DatabaseController controller = Get.find();

  final _labelStyle = GoogleFonts.palanquin(fontSize: 16.0, height: 1.0);
  var isOpen = false;
  final _padding = 12.0;
  final _duration = Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        isOpen = !isOpen;
        controller.onClick(widget.item.id);
      },
      child: AnimatedContainer(
        duration: _duration,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.black45)],
        ),
        padding: EdgeInsets.only(top: _padding, bottom: isOpen ? 0.0 : _padding),
        margin: const EdgeInsets.all(8.0),
        height: FormsItemWidget._height + (isOpen ? FormsItemWidget._textHeight : 0),
        child: Column(
          children: [
            AnimatedContainer(
              height: 40.0 + (isOpen ? _padding : 0),
              padding: EdgeInsets.symmetric(horizontal: _padding),
              duration: _duration,
              child: Row(
                children: [
                  Container(
                    width: 120.0,
                    child: Text(
                      widget.item.birthdate.toString(),
                      style: _labelStyle,
                    ),
                  ),
                  SizedBox(width: 32.0),
                  Container(
                    width: 200.0,
                    child: Text(widget.item.name, style: _labelStyle),
                  ),
                  SizedBox(width: 32.0),
                  Container(
                    width: 200.0,
                    child: Text(widget.item.email, style: _labelStyle),
                  ),
                  SizedBox(width: 32.0),
                  Container(width: 200.0, child: Text(widget.item.treatment, style: _labelStyle)),
                  Icon(isOpen ? Icons.arrow_drop_down : Icons.arrow_right , size: 40.0,)
                ],
              ),
            ),
            Expanded(
              child: AnimatedContainer(
                width: double.infinity,
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.all(_padding),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0))
                ),
                duration: _duration,
                height: isOpen ? FormsItemWidget._textHeight : 0,
                child: Text(widget.item.text),
              ),
            )
          ],
        ),
      ),
    );
  }
}
