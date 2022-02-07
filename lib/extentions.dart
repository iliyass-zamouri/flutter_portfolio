import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() {
    return map((e) => Expanded(flex: 1, child: e));
  }

  Iterable<Widget> addSpaceBetween(space) {
    return map(
        (e) => Padding(padding: EdgeInsets.only(bottom: space), child: e));
  }

  Iterable<Widget> addSpaceDivider(space, Widget divider) {
    List<Widget> widgets = [];
    forEach((e) {
      widgets.add(SizedBox(height: space));
      widgets.add(e);
      widgets.add(SizedBox(height: space));
      widgets.add(divider);
    });
    widgets.removeLast();
    return widgets;
  }
}
