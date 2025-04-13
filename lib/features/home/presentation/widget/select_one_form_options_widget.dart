import 'package:flutter/material.dart';

class SelectOneFormOptionsWidget extends StatefulWidget {
  const SelectOneFormOptionsWidget(
      {super.key, required this.items, required this.onChange});
  final List<String> items;
  final Function(int currentIndex) onChange;
  @override
  State<SelectOneFormOptionsWidget> createState() =>
      _SelectOneFormOptionsWidgetState();
}

class _SelectOneFormOptionsWidgetState
    extends State<SelectOneFormOptionsWidget> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          widget.items.length,
          (index) {
            return Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        index == currentIndex ? Colors.red : Colors.white),
                onPressed: () {
                  setState(() {
                    currentIndex = index;
                  });

                  widget.onChange(currentIndex);
                },
                child: Text(widget.items[index]),
              ),
            );
          },
        ),
        // Expanded(
        //   child: ElevatedButton(onPressed: () {}, child: const Text('Salon')),
        // ),
        // const SizedBox(width: 5),
        // Expanded(
        //   child: ElevatedButton(onPressed: () {}, child: const Text('Salon')),
        // ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';

// printNumber(int x, Function(int x) onPrint) {
//   print(x);
//x+1;
// x*9;

//   onPrint(x);
// }

// void main() {
//   printNumber(3, () {
//     print('object');
//   });
// }
