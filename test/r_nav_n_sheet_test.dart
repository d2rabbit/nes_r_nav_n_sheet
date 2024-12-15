import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:r_nav_n_sheet/r_nav_n_sheet.dart';

void main() {
  test('adds one to input values', () {
    final nav = RNavNSheet(items: [
      RNavItem(icon:IconItem(icon: NesIcons.sun), label: "Home", activeIcon: IconItem(icon: NesIcons.sun)),
      RNavItem(icon: IconItem(icon: NesIcons.moon), label: "Search", activeIcon: IconItem(icon: NesIcons.moon)),
    ]);
    findsNWidgets(nav.items.length);
  });
}
