import 'package:elevate/models/json_fIle/new_collections.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';

import '../item_templelate/ItemTemplate.dart';

class NewCollections extends StatelessWidget {
  const NewCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(left: 60, right: 60),
      color: MyColor.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Utils.textHeader(
              'New Collections', 56, FontWeight.w600, MyColor.primaryTextColor),
          Utils.getSizedBoxHeight(),
          const Divider(color: MyColor.primaryDividerColor),
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
            itemCount: NewProducts.new_coll_products.length,
            itemBuilder: (context, index) {
              final product = NewProducts.new_coll_products[index];
              return ItemTemplate(
                id: product['id'],
                name: product['name'],
                image: product['image'],
                newPrice: product['new_price'],
                oldPrice: product['old_price'],
              );
            },
          ),
        ],
      ),
    );
  }
}
