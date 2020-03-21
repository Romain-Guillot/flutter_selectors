import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:selectors/collection_selector.dart';


class WidthSelector extends StatefulWidget {

  final List<double> widths;
  final Function(dynamic) onSelected;
  final double initialWidth;

  WidthSelector({
    Key key, 
    @required this.widths,
    @required this.onSelected,
    this.initialWidth,
  }) : super(key: key);

  @override
  _WidthSelectorState createState() => _WidthSelectorState();
}

class _WidthSelectorState extends State<WidthSelector> {

  double selectedWidth;

  @override
  void initState() {
    super.initState();
    selectedWidth = widget.initialWidth;
  }

  @override
  Widget build(BuildContext context) {
    return CollectionSelector<double>(
      initialValue: widget.initialWidth,
      values: widget.widths,
      onSelect: widget.onSelected,
      itemBuilder: (dynamic width, _) => Center(
        child: Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle
          ),
        ),
      ),
      indicator: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle
      ),
    );
  }
}