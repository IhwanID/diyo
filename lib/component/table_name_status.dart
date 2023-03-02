import 'package:diyo/model/table_state.dart';
import 'package:flutter/material.dart';

Widget tableNameAndStatus(int index, TableState state) {
  return Column(
    children: [
      const SizedBox(height: 16),
      Text("Table ${index + 1}", style: const TextStyle(fontSize: 28)),
      const SizedBox(
        height: 16,
      ),
      Text("Status: ${state.displayTitle}",
          style: const TextStyle(fontSize: 21)),
      const SizedBox(
        height: 16,
      ),
    ],
  );
}