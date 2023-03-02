import 'package:diyo/component/table_name_status.dart';
import 'package:diyo/model/table_state.dart';
import 'package:flutter/material.dart';

class DetailAvailablePage extends StatelessWidget {
  final TableState state;
  final int index;
  final Function(TableState state) callback;

  const DetailAvailablePage(
      {super.key,
      required this.state,
      required this.index,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            tableNameAndStatus(index, state),
            const Text(
              "Action",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  callback(TableState.seated);
                },
                child: const Text("Print QR")),
          ],
        ),
      ),
    );
  }
}