import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:selectors/collection_selector.dart';



class ColorSelector extends StatefulWidget {

  final List<Color> colors;
  final Function(dynamic) onSelected;
  final Color initialColor;
  final bool showSelectedItem;

  ColorSelector({
    Key key, 
    @required this.colors,
    @required this.onSelected,
    this.initialColor,
    this.showSelectedItem = true
  }) : super(key: key);

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {

  Color selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return CollectionSelector<Color>(
      initialValue: widget.initialColor,
      values: widget.colors,
      onSelect: widget.onSelected,
      itemBuilder: (dynamic color, bool isSelected) => Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        ),
        child: isSelected && widget.showSelectedItem ? Icon(Icons.check) : Container(),
      ),
    );
  }
}