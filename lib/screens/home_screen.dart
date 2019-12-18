import 'package:flutter/material.dart';
import 'package:lojavirtual/tabs/fabricante_tab.dart';
import 'package:lojavirtual/tabs/home_tab.dart';
import 'package:lojavirtual/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Fabricantes"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: FabricantesTab(),
        )
      ],
    );
  }
}
