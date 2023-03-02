import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final Function(Menu menu) callback;
  const MenuWidget({super.key, required this.callback});
  

  @override
  Widget build(BuildContext context) {
    
     List<Menu> menus = [
    const Menu(name: "Nasi Goreng", price: 15000),
    const Menu(name: "Cah Kangkung", price: 10000),
    const Menu(name: "Mie Ayam", price: 18000),
    const Menu(name: "Capcay Goreng", price: 20000),
    const Menu(name: "Lontong Sayur", price: 14000),
    const Menu(name: "Soto Medan", price: 13500),
    const Menu(name: "Ayam Pop", price: 12000),
    const Menu(name: "Bubur Ayam", price: 15000),
    const Menu(name: "Seblak", price: 8000)
  ];
  
    return SingleChildScrollView(
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
        children: List.generate(9, (index) {
          return GestureDetector(
            onTap: () {
              callback(menus[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                
                color: Colors.red,
                child: Center(
                  child: Text(
                    menus[index].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white,
                  ),
                ),
              ),
            ),
          ));
        }),
      ),
    );
  }
}

class Menu {
  final String name;
  final int price;

  const Menu({required this.name, required this.price});
}
