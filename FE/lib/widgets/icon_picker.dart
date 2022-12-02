import 'package:flutter/material.dart';

import 'package:static_app/utils/icons_list.dart';

// ignore: must_be_immutable
class IconPicker extends StatefulWidget {
  double appBarHeight = 0;

  final Function selectIcon;

  IconPicker(this.appBarHeight, this.selectIcon, {super.key});

  @override
  State<IconPicker> createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  Widget _buildSelectableIcon(iconData) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200),
      ),
      onTap: () {
        widget.selectIcon(iconData);
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            iconData,
            color: Colors.black,
          ),
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
        height: 150,
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
            for (IconData iconData in pickerIcons)
              _buildSelectableIcon(iconData)
          ],
        ),
      ),
    );
  }
}
