import 'package:diyo/model/table_state.dart';
import 'package:flutter/material.dart';

class ListCorlorDescriptionWidget extends StatelessWidget {
  const ListCorlorDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<TableState> states = TableState.values.map((e) => e).toList();

    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: states.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: BoxColorWidget(state: states[index]),
            title: Text(states[index].displayTitle),
          );
        });
  }
}

class BoxColorWidget extends StatelessWidget {
  final TableState state;
  const BoxColorWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42.0,
      height: 42.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: state.fillColor,
            border: Border.all(color: state.borderColor, width: 2)),
      ),
    );
  }
}