import 'package:diyo/component/box_color_widget.dart';
import 'package:diyo/component/home_widget.dart';
import 'package:diyo/model/table_state.dart';
import 'package:flutter/material.dart';

class MainTableWidget extends StatefulWidget {
  final List<TableState> states;
  final Function(int) callback;
  const MainTableWidget(
      {super.key, required this.states, required this.callback});

  @override
  State<MainTableWidget> createState() => _MainTableWidgetState();
}

class _MainTableWidgetState extends State<MainTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TableGridWidget(
                    states: widget.states,
                    callback: (index) {
                      widget.callback(index);
                    },
                  ),
                  const ListCorlorDescriptionWidget()
                ],
              ))),
        ),
      ],
    );
  }
}