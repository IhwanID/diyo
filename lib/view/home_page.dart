import 'package:diyo/component/home_table_widget.dart';
import 'package:diyo/detail_page/detail_available_page.dart';
import 'package:diyo/detail_page/detail_billing_page.dart';
import 'package:diyo/detail_page/detail_ordered_page.dart';
import 'package:diyo/detail_page/detail_seated_page.dart';
import 'package:diyo/component/home_drawer.dart';
import 'package:diyo/component/menu_widget.dart';
import 'package:diyo/model/table_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tableStates = [
    TableState.available,
    TableState.billing,
    TableState.ordered,
    TableState.seated,
    TableState.billing,
    TableState.available
  ];
  var isLargeScreen = false;

  bool isSelectingMenu = false;

  int? selectedIndex;

  var orderedMenu = <int, List<Menu>>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diyo"),
        backgroundColor: Colors.red,
      ),
      drawer: const HomeDrawer(),
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }

        return Row(children: <Widget>[
          Expanded(
              child: isSelectingMenu
                  ? MenuWidget(
                      callback: (menu) {
                        setState(() {
                          if (orderedMenu[selectedIndex!] != null) {
                            var menus = orderedMenu[selectedIndex!];
                            menus!.add(menu);
                            orderedMenu[selectedIndex!] = menus;
                          } else {
                            orderedMenu[selectedIndex!] = [menu];
                          }
                        });
                      },
                    )
                  : MainTableWidget(
                      states: tableStates,
                      callback: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    )),
          isLargeScreen
              ? selectedIndex != null
                  ? Expanded(
                      child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: getDetailPage(tableStates[selectedIndex!]),
                    ))
                  : Expanded(
                      child: Container(),
                    )
              : Container(),
        ]);
      }),
    );
  }

  Map<Menu, int> getMenuMap() {
    Map<Menu, int> menuMap = {};
    var menus = orderedMenu[selectedIndex!];
    if (menus != null) {
      
      for (var menu in menus) {
        final key = menu;
        if (menuMap.containsKey(key)) {
          menuMap[key] = menuMap[key]! + 1;
        } else {
          menuMap[key] = 1;
        }
      }
    }

    return menuMap;
  }

  Widget getDetailPage(TableState state) {
    switch (state) {
      case TableState.available:
        return DetailAvailablePage(
          state: tableStates[selectedIndex!],
          index: selectedIndex!,
          callback: (state) {
            setState(() {
              tableStates[selectedIndex!] = state;
            });
          },
        );
      case TableState.seated:
        return DetailSeatedPage(
          state: tableStates[selectedIndex!],
          index: selectedIndex!,
          menus: orderedMenu[selectedIndex!] ?? [],
          menusMap: getMenuMap(),
          remove: (menu) {
            setState(() {
              orderedMenu[selectedIndex!]!.remove(menu);
            });
          },
          callback: (state) {
            setState(
              () {
                if (state == TableState.seated) {
                  isSelectingMenu = true;
                } else {
                  tableStates[selectedIndex!] = state;
                  isSelectingMenu = false;
                }
              },
            );
          },
          isSelectingMenu: isSelectingMenu,
        );
      case TableState.ordered:
        return DetailOrderedPage(
          state: tableStates[selectedIndex!],
          index: selectedIndex!,
          menus: orderedMenu[selectedIndex!] ?? [],
          menusMap: getMenuMap(),
          callback: (state) {
            setState(
              () {
                if (state == TableState.seated) {
                  isSelectingMenu = true;
                   tableStates[selectedIndex!] = state;
                } else {
                  tableStates[selectedIndex!] = state;
                  isSelectingMenu = false;
                }
              },
            );
          },
          isSelectingMenu: isSelectingMenu,
        );
      case TableState.billing:
        return DetailBillingPage(
          state: tableStates[selectedIndex!],
          index: selectedIndex!,
          callback: (state) {
            setState(
              () {
                tableStates[selectedIndex!] = state;
              },
            );
          },
          isSelectingMenu: isSelectingMenu,
        );
    }
  }
}
