import 'package:diyo/model/table_state.dart';
import 'package:flutter/material.dart';

class TableGridWidget extends StatefulWidget {
  final List<TableState> states;
  final Function(int) callback;
  const TableGridWidget(
      {super.key, required this.states, required this.callback});

  @override
  State<TableGridWidget> createState() => _TableGridWidgetState();
}

class _TableGridWidgetState extends State<TableGridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 8,
      children: List.generate(6, (index) {
        return tableWidget(index);
      }),
    );
  }

  Widget tableWidget(int index) {
    return GestureDetector(
      onTap: () {
        widget.callback(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
         
          decoration: BoxDecoration(
              color: widget.states[index].fillColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  width: 2, color: widget.states[index].borderColor)),
          child: Center(
            child: Text(
              'Table ${index + 1}',
              style: TextStyle(
                   color: widget.states[index].foregroundColor),
            ),
          ),
        ),
      ),
    );
  }
}
