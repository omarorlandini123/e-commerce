import 'package:flutter/material.dart';

class TabGeneral {
  List<ItemTab> items;
  List<Tab> tabs;
  List<Widget> elementos;

  TabGeneral() {
    items = new List<ItemTab>();
    tabs = new List<Tab>();
    elementos = new List<Widget>();
  }

  void addTab(Tab tab, Widget elemento) {
    items.add(new ItemTab(tab, elemento));
    tabs.add(tab);
    elementos.add(elemento);
  }

  List<Tab> getTabs() {
    return tabs;
  }

  List<Widget> getElementos() {
    return elementos;
  }
}


class ItemTab {
  Tab tab;
  Widget elemento;
  ItemTab(this.tab, this.elemento);
}