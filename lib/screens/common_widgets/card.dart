import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  int? index;
  String? name;
  Item({super.key, required this.index, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,'/particularUser',arguments: index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        margin: const EdgeInsets.only(bottom: 5, left: 2, right: 2),
        decoration: BoxDecoration(border: Border.all(width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('${index! + 1}'), Text(name!)],
        ),
      ),
    );
  }
}
