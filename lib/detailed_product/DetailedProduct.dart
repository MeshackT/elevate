import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ItemDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Utils.textHeader(
            product['name'], 15, FontWeight.bold, MyColor.primaryTextColor),
        backgroundColor: MyColor.backgroundColor,
        iconTheme: const IconThemeData(
          color: MyColor.primaryIconColor,
        ),
      ),
      backgroundColor: MyColor.backgroundColor,
      extendBodyBehindAppBar: false,
      extendBody: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  // Left side - product images
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ...List.generate(
                                3,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.network(product['image'],
                                          height: 150),
                                    )),
                          ],
                        ),
                        Utils.getSizedBoxWidth(),
                        Image.network(product['image'], height: 400),
                      ],
                    ),
                  ),
                  // Right side - product details
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Utils.textHeader(product['name'], 24, FontWeight.bold,
                              MyColor.primaryTextColor),
                          Utils.getSizedBoxHeight(),
                          Row(
                            children: [
                              Utils.textOldPrice(
                                  "\$${product['old_price']}",
                                  24.0,
                                  FontWeight.bold,
                                  MyColor.primaryRedColor),
                              Utils.getSizedBoxWidth(),
                              Utils.textHeader(
                                  "\$${product['new_price']}",
                                  24.0,
                                  FontWeight.bold,
                                  MyColor.primaryTextColor),
                            ],
                          ),
                          Utils.getSizedBoxHeight(),
                          Utils.textHeader(
                              'or higher. You are currently using plaintext http to connect. Please visit the GitHub blog for more information: https://github.blog/2021-08-23-npm-registry-deprecating-tls-1-0-tls-1-1/ npm notice Beginning October 4, 2021, all connections to the npm registry - including for package installation - must use TLS 1.2 or higher. You are currently using plaintext http to connect. Please visit the GitHub blog for more information: https://github.blog/2021-08-23-npm-registry-deprecating-tls-1-0-tls-1-1/',
                              14,
                              FontWeight.w500,
                              MyColor.primaryTextColor),
                          Utils.getSizedBoxHeight(),
                          Utils.textHeader("Select Size", 14, FontWeight.bold,
                              MyColor.primaryTextColor),
                          Utils.textHeader("Category: ${product["category"]}",
                              14, FontWeight.w400, MyColor.primaryTextColor),
                          Utils.getSizedBoxHeight(),
                          Wrap(
                            spacing: 5.0,
                            children: ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
                              return ChoiceChip(
                                label: Text(size),
                                selected: false,
                                onSelected: (selected) {
                                  // TODO: Handle size selection
                                },
                              );
                            }).toList(),
                          ),
                          Utils.getSizedBoxHeight(),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                color: MyColor.secondaryTextColor,
                                child: IconButton(
                                    onPressed: () {
                                      // TODO: remove to cart logic
                                      // BlocProvider.of<MenBloc>(context).add(AddToCartEvent(product));
                                    },
                                    color: Colors.transparent,
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: MyColor.tertiaryIconColor,
                                    )),
                              ),
                              Utils.getSizedBoxWidth(),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: MyColor.backgroundColor,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1,
                                        color: MyColor.secondaryTextColor,
                                      ))),
                                ),
                              ),
                              Utils.getSizedBoxWidth(),
                              Container(
                                width: 40,
                                height: 40,
                                color: MyColor.secondaryTextColor,
                                child: IconButton(
                                    onPressed: () {
                                      // TODO: Add to cart logic
                                      // BlocProvider.of<MenBloc>(context).add(AddToCartEvent(product));
                                    },
                                    color: Colors.transparent,
                                    icon: const Icon(
                                      Icons.add,
                                      size: 15,
                                      color: MyColor.tertiaryIconColor,
                                    )),
                              ),
                            ],
                          ),
                          Utils.getSizedBoxHeight(),
                          Utils.buttonRed(
                              "BUY NOW",
                              13,
                              FontWeight.bold,
                              MyColor.primaryWhiteTextColor,
                              () =>
                                  // TODO: Checkout logic
                                  // BlocProvider.of<MenBloc>(context).add(CheckoutEvent(product));

                                  null),
                          Utils.getSizedBoxHeight(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
