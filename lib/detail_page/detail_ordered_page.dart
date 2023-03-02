import 'package:diyo/component/table_name_status.dart';
import 'package:diyo/component/menu_widget.dart';
import 'package:diyo/model/table_state.dart';
import 'package:flutter/material.dart';



class DetailOrderedPage extends StatefulWidget {
  final TableState state;
  final int index;
  final bool isSelectingMenu;
  final Function(TableState state) callback;
  final List<Menu> menus;
  final Map<Menu, int> menusMap;

  const DetailOrderedPage(
      {super.key,
      required this.state,
      required this.index,
      required this.callback,
      required this.isSelectingMenu,
      required this.menus,
      required this.menusMap,
      });

  @override
  State<DetailOrderedPage> createState() => _DetailOrderedPageState();
}

class _DetailOrderedPageState extends State<DetailOrderedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              tableNameAndStatus(widget.index, widget.state),
              const Text("Current Bill"),
       const SizedBox(
                height: 16,
              ),
              Column(
                  children: getMenuList(),
                ),
                const SizedBox(
                  height: 16,
                ),
                widget.menus.isNotEmpty
                    ? Text(
                        "Total: Rp. ${widget.menus.map((e) => e.price).reduce((sum, value) => sum + value)}")
                    : Container(),
                const SizedBox(
                  height: 16,
                ),
              ElevatedButton(
                  onPressed: () {
                    widget.callback(TableState.seated);
                  },
                  child: const Text("Add Order")),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    widget.callback(TableState.billing);
                  },
                  child: const Text("Billing"))
            ],
          ),
        ),
      ),
    );
  }

List<Widget> getMenuList() {
    List<Widget> lists = [];
    widget.menusMap.forEach((key, value) {
      var item = Row(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("${key.name} X $value"), Text("${key.price}")],
          )),
          
        ],
      );

      lists.add(item);
    });

    return lists;
  }
}