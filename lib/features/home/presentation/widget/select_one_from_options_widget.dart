import 'package:flutter/material.dart';

class SelectOneFromOptionsWidget extends StatefulWidget {
  const SelectOneFromOptionsWidget({
    super.key,
    required this.items,
    required this.onOptionSelected,
  });
  final List<String> items;
  final Function(String selectedValue) onOptionSelected;
  @override
  State<SelectOneFromOptionsWidget> createState() =>
      _SelectOneFromOptionsWidgetState();
}

class _SelectOneFromOptionsWidgetState
    extends State<SelectOneFromOptionsWidget> {
  int currentINdex = -1;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(widget.items.length, (index) {
        return Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        index == currentINdex ? Colors.red : Colors.white),
                onPressed: () {
                  setState(() {
                    currentINdex = index;
                  });
                  widget.onOptionSelected(widget.items[currentINdex]);
                },
                child: Text(widget.items[index])));
      }),
    ]);
  }
}
