import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CollectionSelector<T> extends StatefulWidget {

  final List<T> values;
  final Function(T) onSelect;
  final BoxDecoration indicator;
  final T initialValue;
  final Widget Function(T, bool) itemBuilder;

  CollectionSelector({
    Key key, 
    @required this.values,
    @required this.onSelect,
    @required this.itemBuilder,
    this.initialValue,
    this.indicator
  }) : super(key: key);

  @override
  _CollectionSelectorState<T> createState() => _CollectionSelectorState<T>();
}


class _CollectionSelectorState<T> extends State<CollectionSelector> {

  T selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.values.map((e) => 
        InkWell(
          onTap: () {
            setState(() => selectedValue = e);
            widget.onSelect(e);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: selectedValue == e ? widget.indicator : BoxDecoration(),
            child: IconTheme(
              data: IconThemeData(color: Colors.white),
              child: widget.itemBuilder(e, selectedValue == e),
            )
          ),
        ),
      ).toList()
    );
  }
}