import 'package:elevate/models/json_fIle/men_products.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../detailed_product/DetailedProduct.dart';
import '../../item_templelate/ItemTemplate.dart';

class MenPage extends StatelessWidget {
  const MenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor.backgroundColor,
        iconTheme: const IconThemeData(
          color: MyColor.primaryIconColor,
        ),
      ),
      extendBodyBehindAppBar: false,
      body: Container(
        // padding: const EdgeInsets.only(60.0),
        padding: const EdgeInsets.only(left: 60, right: 60, top: 5, bottom: 60),
        color: MyColor.backgroundColor,
        height: screenHeight,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Utils.textHeader("Men's Clothing", 36, FontWeight.bold,
                  MyColor.primaryTextColor),
              Utils.getSizedBoxHeight(),
              Utils.lineDivider(),
              Utils.getSizedBoxHeight(),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: MenProduct.men_products.length,
                itemBuilder: (context, index) {
                  final product = MenProduct.men_products[index];
                  return GestureDetector(
                    onTap: () {
                      // pass the clicked item data to view largely
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ItemDetailsScreen(product: product),
                        ),
                      );
                    },
                    child: ItemTemplate(
                      id: product['id'],
                      name: product['name'],
                      image: product['image'],
                      newPrice: product['new_price'],
                      oldPrice: product['old_price'],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
