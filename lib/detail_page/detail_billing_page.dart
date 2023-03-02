import 'package:diyo/component/table_name_status.dart';
import 'package:diyo/model/payment_type.dart';
import 'package:diyo/model/table_state.dart';
import 'package:flutter/material.dart';

class DetailBillingPage extends StatefulWidget {
  final TableState state;
  final int index;
  final bool isSelectingMenu;
  final Function(TableState state) callback;

  const DetailBillingPage(
      {super.key,
      required this.state,
      required this.index,
      required this.callback,
      required this.isSelectingMenu});

  @override
  State<DetailBillingPage> createState() => _DetailBillingPageState();
}

class _DetailBillingPageState extends State<DetailBillingPage> {
  PaymentType? paymentType = PaymentType.cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              tableNameAndStatus(widget.index, widget.state),
              const Text(
                "Action",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              for (var item in PaymentType.values.map((e) => e).toList())
                ListTile(
                  title: GestureDetector(
                    child: Text(item.title),
                    onTap: () {
                      setState(() {
                        paymentType = item;
                      });
                    },
                  ),
                  leading: Radio<PaymentType>(
                    fillColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.red;
                      } else {
                        return Colors.grey;
                      }
                    }),
                    value: item,
                    groupValue: paymentType,
                    onChanged: (PaymentType? value) {
                      setState(() {
                        paymentType = value;
                      });
                    },
                  ),
                ),
              ElevatedButton(
                  onPressed: () {
                    widget.callback(TableState.available);
                  },
                  child: const Text("Payment")),
            ],
          ),
        ),
      ),
    );
  }
}
