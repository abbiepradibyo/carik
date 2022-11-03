import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String categorie;
  final bool isSelected;
  const Categories(
      {super.key, required this.categorie, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(isSelected);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
            border:
                Border.all(color: isSelected ? Colors.black : Colors.black45),
            color: isSelected ? Color(0xFF3C4048) : Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          categorie,
          style:
              TextStyle(color: isSelected ? Colors.white : Color(0xFF3C4048)),
        ),
      ),
    );
  }
}
