import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';

class ItemTemplate extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final double newPrice;
  final double oldPrice;

  const ItemTemplate({
    required this.id,
    required this.name,
    required this.image,
    required this.newPrice,
    required this.oldPrice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              child: Container(
                color: MyColor.backgroundColor.withOpacity(.7),
                width: 80,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Utils.textHeader(
                      '\$$newPrice',
                      14,
                      FontWeight.w500,
                      MyColor.primaryTextRedColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 2, bottom: 1),
                      child: Utils.lineDivider(),
                    ),
                    Utils.textOldPrice(
                      'WAS \$$oldPrice',
                      13,
                      FontWeight.w500,
                      MyColor.primaryTextColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              color: MyColor.backgroundColor.withOpacity(.9),
              width: screenWidth,
              height: screenHeight / 8,
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: MyColor.primaryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
