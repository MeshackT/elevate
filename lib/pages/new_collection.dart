import 'package:flutter/material.dart';

import '../models/json_fIle/new_collections.dart';
import 'item_templelate/ItemTemplate.dart';

class NewCollections extends StatelessWidget {
  const NewCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0, // Horizontal space between items
      runSpacing: 10.0, // Vertical space between lines
      children: NewProducts.new_coll_products.map((product) {
        return SizedBox(
          width: 200,
          height: 300,
          // Adjust width as needed
          child: ItemTemplate(
            id: product['id'],
            name: product['name'],
            image: product['image'],
            newPrice: product['new_price'],
            oldPrice: product['old_price'],
          ),
        );
      }).toList(),
    );

    //   LayoutBuilder(
    //   builder: (context, constraint) {
    //     if (constraint.maxWidth > Utils.mobileWidth) {
    //       return Container(
    //         padding: const EdgeInsets.all(16.0),
    //         margin: const EdgeInsets.only(left: 60, right: 60),
    //         color: MyColor.backgroundColor,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Utils.textHeader('New Collections', 56, FontWeight.w600,
    //                 MyColor.primaryTextColor),
    //             Utils.getSizedBoxHeight(),
    //             const Divider(color: MyColor.primaryDividerColor),
    //             Utils.getSizedBoxHeight(),
    //             Wrap(
    //               spacing: 10.0, // Horizontal space between items
    //               runSpacing: 10.0, // Vertical space between lines
    //               children: NewProducts.new_coll_products.map((product) {
    //                 return Container(
    //                   width: 200, // Adjust width as needed
    //                   child: ItemTemplate(
    //                     id: product['id'],
    //                     name: product['name'],
    //                     image: product['image'],
    //                     newPrice: product['new_price'],
    //                     oldPrice: product['old_price'],
    //                   ),
    //                 );
    //               }).toList(),
    //             ),
    //
    //             // GridView.builder(
    //             //   shrinkWrap: true,
    //             //   physics: const NeverScrollableScrollPhysics(),
    //             //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             //     crossAxisCount: 4,
    //             //     crossAxisSpacing: 10,
    //             //     mainAxisSpacing: 10,
    //             //     childAspectRatio: 0.7,
    //             //   ),
    //             //   itemCount: NewProducts.new_coll_products.length,
    //             //   itemBuilder: (context, index) {
    //             //     final product = NewProducts.new_coll_products[index];
    //             //     return ItemTemplate(
    //             //       id: product['id'],
    //             //       name: product['name'],
    //             //       image: product['image'],
    //             //       newPrice: product['new_price'],
    //             //       oldPrice: product['old_price'],
    //             //     );
    //             //   },
    //             // ),
    //           ],
    //         ),
    //       );
    //     } else {
    //       // Return mobile view
    //       return Container(
    //         // padding: const EdgeInsets.all(10.0),
    //         margin: const EdgeInsets.only(left: 10, right: 10),
    //         color: MyColor.backgroundColor,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Utils.textHeader('New Collections', 28, FontWeight.w600,
    //                 MyColor.primaryTextColor),
    //             Utils.getSizedBoxHeight(),
    //             const Divider(color: MyColor.primaryDividerColor),
    //             Utils.getSizedBoxHeight(),
    //             SizedBox(
    //               height: 300, // Adjust height as needed
    //               child: ListView.builder(
    //                 scrollDirection: Axis.horizontal,
    //                 itemCount: NewProducts.new_coll_products.length,
    //                 itemBuilder: (context, index) {
    //                   final product = NewProducts.new_coll_products[index];
    //                   return Container(
    //                     width: 200, // Adjust width as needed
    //                     margin: const EdgeInsets.only(right: 10),
    //                     child: ItemTemplate(
    //                       id: product['id'],
    //                       name: product['name'],
    //                       image: product['image'],
    //                       newPrice: product['new_price'],
    //                       oldPrice: product['old_price'],
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
