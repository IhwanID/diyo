import 'package:diyo/component/table_name_status.dart';
import 'package:diyo/component/menu_widget.dart';
import 'package:diyo/model/table_state.dart';
import 'package:flutter/material.dart';

class DetailSeatedPage extends StatefulWidget {
  final TableState state;
  final int index;
  final bool isSelectingMenu;
  final List<Menu> menus;
  final Map<Menu, int> menusMap;
  final Function(TableState state) callback;
  final Function(Menu menu) remove;

  const DetailSeatedPage(
      {super.key,
      required this.state,
      required this.index,
      required this.callback,
      required this.isSelectingMenu,
      required this.menus,
      required this.menusMap,
      required this.remove});

  @override
  State<DetailSeatedPage> createState() => _DetailSeatedPageState();
}

class _DetailSeatedPageState extends State<DetailSeatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              tableNameAndStatus(widget.index, widget.state),
               widget.menus.isNotEmpty
                  ? const Text(
                      "Ordered Menu")
                  : Container(),
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
              getWidget(),
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
          RawMaterialButton(
            onPressed: () {
              widget.remove(key);
            },
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(15.0),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.remove,
              size: 12.0,
            ),
          )
        ],
      );

      lists.add(item);
    });

    return lists;
  }

  Widget getWidget() {
    if (widget.isSelectingMenu) {
      return ElevatedButton(
          onPressed: () {
            widget.callback(TableState.ordered);
          },
          child: const Text("Add Order"));
    } else {
      return ElevatedButton(
          onPressed: () {
            widget.callback(TableState.seated);
          },
          child: const Text("Make An Order"));
    }
  }
}
