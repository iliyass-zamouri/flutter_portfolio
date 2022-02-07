import 'package:flutter/material.dart';
import 'package:flutter_portfolio/extentions.dart';

class ResponsiveList extends StatelessWidget {
  final List<Widget> children;
  final RowConfiguration rowConfig;
  final int rowNum;
  final ColumnConfiguration columnConfig;
  const ResponsiveList(
      {Key? key,
      required this.children,
      this.rowNum = 2,
      this.columnConfig = const ColumnConfiguration(),
      this.rowConfig = const RowConfiguration()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaData = MediaQuery.of(context);

    if (mediaData.size.width >= 1024 && rowNum != 0) {
      if (children.length > rowNum) {
        int lines = (children.length / rowNum).ceil();
        List<Widget> newList = [];
        int index = 0;
        for (int i = 0; i < lines; i++) {
          List<Widget> rowLine = [];
          for (int j = 0; j < rowNum && children.length > index; j++) {
            rowLine.add(children[index]);
            index++;
          }

          newList.add(Row(
            mainAxisAlignment: rowConfig.mainAxis,
            crossAxisAlignment: rowConfig.crossAxis,
            children: rowLine.expandEqually().toList(),
          ));
        }
        return Column(
          mainAxisAlignment: columnConfig.mainAxis,
          crossAxisAlignment: columnConfig.crossAxis,
          children: newList.toList(),
        );
      } else {
        return Row(
          mainAxisAlignment: rowConfig.mainAxis,
          crossAxisAlignment: rowConfig.crossAxis,
          children: children.expandEqually().toList(),
        );
      }
    } else {
      return Column(
        mainAxisAlignment: columnConfig.mainAxis,
        crossAxisAlignment: columnConfig.crossAxis,
        children: children,
      );
    }
  }
}

class RowConfiguration {
  final MainAxisAlignment mainAxis;
  final CrossAxisAlignment crossAxis;

  const RowConfiguration(
      {this.mainAxis = MainAxisAlignment.start,
      this.crossAxis = CrossAxisAlignment.start});
}

class ColumnConfiguration {
  final MainAxisAlignment mainAxis;
  final CrossAxisAlignment crossAxis;

  const ColumnConfiguration(
      {this.mainAxis = MainAxisAlignment.start,
      this.crossAxis = CrossAxisAlignment.start});
}
