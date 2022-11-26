import 'package:flutter/material.dart';

import 'package:static_app/utils/colors_map.dart';

// ignore: must_be_immutable
class ColorPicker extends StatefulWidget {
  double appBarHeight = 0;

  final Function selectColor;

  ColorPicker(this.appBarHeight, this.selectColor, {super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Widget _buildSelectableColor(color) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200),
      ),
      onTap: () {
        widget.selectColor(color);
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: CircleAvatar(
          backgroundColor: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
        ),
        child: GridView.count(
          crossAxisCount: 5,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          children: [
            for (Color color in pickerColors) _buildSelectableColor(color)
          ],
        ),
      ),
    );
  }
}
