import 'package:elevate/pages/men_page/men_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme_utils/theme_utils.dart';
import '../../utils/utils.dart';
import '../banner_view/banner_view.dart';

class MenPage extends StatefulWidget {
  const MenPage({super.key});

  @override
  State<MenPage> createState() => _MenPageState();
}

class _MenPageState extends State<MenPage> {
  Color iconColor = MyColor.primaryIconColor;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= Utils.mobileWidth) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColor.backgroundColor,
            title: Utils.textHeader(
                "Men", 10, FontWeight.bold, MyColor.primaryTextColor),
          ),
          backgroundColor: MyColor.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const BannerView(category: 'men'),
                BlocProvider(
                  create: (_) => MenBloc()..add(LoadProductMen()),
                  child: BlocBuilder<MenBloc, MenState>(
                    builder: (context, state) {
                      if (state is MenLoading) {
                        return Center(child: Utils.loadingIcon());
                      } else if (state is MenSuccess) {
                        final products = state.menProducts;

                        return products.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: screenHeight,
                                  width: screenWidth, // Adjust height as needed
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      // Number of columns in the grid
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 2.0,
                                      // Adjusts the aspect ratio of each item
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: products.length,
                                    itemBuilder: (context, index) {
                                      final product = products[index];
                                      Utils.logger.i(
                                          "Size of list: ${products.length}");

                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        width: screenWidth,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: product.image.isNotEmpty
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      10)),
                                                      child: Image.network(
                                                        product.image[index],

                                                        fit: BoxFit.scaleDown,
                                                        // Change to contain to ensure the image fits within the container
                                                        width: double.infinity,
                                                        // Ensure width is set to fill the container
                                                        height: double.infinity,
                                                      ),
                                                    )
                                                  : Container(
                                                      color: Colors.grey[200],
                                                      width: double.infinity,
                                                    ),
                                            ),
                                            Container(
                                              color: MyColor.backgroundColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Utils.textHeader(
                                                        product.name,
                                                        constraints.maxWidth <=
                                                                Utils
                                                                    .mobileWidth
                                                            ? 10
                                                            : 24 * .5,
                                                        FontWeight.normal,
                                                        MyColor
                                                            .primaryTextColor),
                                                    // Utils.getSizedBoxHeightFive(),
                                                    // Utils.textHeader(
                                                    //     "${product.category}",
                                                    //     constraints.maxWidth <=
                                                    //             Utils.mobileWidth
                                                    //         ? 9
                                                    //         : 24 * .5,
                                                    //     FontWeight.normal,
                                                    //     MyColor.primaryTextColor),
                                                    // Utils.getSizedBoxHeightFive(),
                                                    Utils
                                                        .getSizedBoxHeightFive(),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Utils.like(() {
                                                          Utils.logger.i(
                                                              "Pressed like");
                                                        }),
                                                        Utils
                                                            .getSizedBoxWidthFive(),
                                                        //   add the number of likes from db
                                                        Utils.textHeader(
                                                          "0",
                                                          9,
                                                          FontWeight.normal,
                                                          MyColor
                                                              .primaryTextColor,
                                                        ),
                                                      ],
                                                    ),
                                                    Utils.getSizedBoxHeight(),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Utils.textHeader(
                                                                "R${product.newPrice}",
                                                                constraints.maxWidth <=
                                                                        Utils
                                                                            .mobileWidth
                                                                    ? 9
                                                                    : 24 * .5,
                                                                FontWeight
                                                                    .normal,
                                                                MyColor
                                                                    .primaryTextColor),
                                                            Utils
                                                                .getSizedBoxWidthFive(),
                                                            Utils.textOldPrice(
                                                                "R${product.oldPrice}",
                                                                constraints.maxWidth <=
                                                                        Utils
                                                                            .mobileWidth
                                                                    ? 9
                                                                    : 24 * .5,
                                                                FontWeight
                                                                    .normal,
                                                                MyColor
                                                                    .primaryRedColor),
                                                          ],
                                                        ),
                                                        Utils.addToCart(
                                                          function: () {
                                                            Utils.logger.i(
                                                                "add to cart");
                                                          },
                                                          iconColor: iconColor,
                                                          // Pass the dynamic icon color here
                                                          onHoverFunction:
                                                              (PointerEvent
                                                                  event) {
                                                            Utils.logger.i(
                                                                "add to hover");
                                                            setState(() {
                                                              iconColor = MyColor
                                                                  .primaryIconRedColor; // Change icon color to red on hover
                                                            });
                                                          },
                                                          onExitFunction:
                                                              (PointerEvent
                                                                  event) {
                                                            Utils.logger.i(
                                                                "add to leaving hover");
                                                            setState(() {
                                                              iconColor = MyColor
                                                                  .primaryIconColor; // Reset icon color to original on exit
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Center(
                                child: Utils.textHeader(
                                    'No products available.',
                                    10,
                                    FontWeight.bold,
                                    MyColor.primaryTextColor),
                              );
                      } else if (state is MenFailure) {
                        return Center(
                          child: Center(
                            child: Utils.textHeader(state.error, 10,
                                FontWeight.bold, MyColor.primaryTextColor),
                          ),
                        );
                      } else {
                        return Center(
                          child: Utils.textHeader('No products available.', 10,
                              FontWeight.bold, MyColor.primaryTextColor),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.backgroundColor,
          title: Utils.textHeader(
            "Men",
            10,
            FontWeight.bold,
            MyColor.primaryTextColor,
          ),
        ),
        backgroundColor: MyColor.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const BannerView(category: 'men'),
              BlocProvider(
                create: (_) => MenBloc()..add(LoadProductMen()),
                child: BlocBuilder<MenBloc, MenState>(
                  builder: (context, state) {
                    if (state is MenLoading) {
                      return Center(child: Utils.loadingIcon());
                    } else if (state is MenSuccess) {
                      final products = state.menProducts;

                      return products.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: screenHeight,
                                width: screenWidth, // Adjust height as needed
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        4, // Number of columns in the grid
                                    crossAxisSpacing: 1.0,
                                    mainAxisSpacing: 1.0,
                                    // Adjusts the aspect ratio of each item
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    final product = products[index];
                                    // Utils.logger.i("Size of list: ${products.length}");

                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      width: screenWidth,
                                      color: MyColor.backgroundColor,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: product.image.isNotEmpty
                                                ? ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius
                                                            .vertical(
                                                            top:
                                                                Radius.circular(
                                                                    10)),
                                                    child: Image.network(
                                                      product.image[index],

                                                      fit: BoxFit.scaleDown,
                                                      // Change to contain to ensure the image fits within the container
                                                      width: double.infinity,
                                                      // Ensure width is set to fill the container
                                                      height: double.infinity,
                                                    ),
                                                  )
                                                : Container(
                                                    color: Colors.grey[200],
                                                    width: double.infinity,
                                                  ),
                                          ),
                                          Container(
                                            color: MyColor.backgroundColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Utils.textHeader(
                                                      product.name,
                                                      10,
                                                      FontWeight.normal,
                                                      MyColor.primaryTextColor),
                                                  // Utils.getSizedBoxHeightFive(),
                                                  // Utils.textHeader(
                                                  //     "${product.category}",
                                                  //     constraints.maxWidth <=
                                                  //             Utils.mobileWidth
                                                  //         ? 9
                                                  //         : 24 * .5,
                                                  //     FontWeight.normal,
                                                  //     MyColor.primaryTextColor),
                                                  // Utils.getSizedBoxHeightFive(),
                                                  Utils.getSizedBoxHeightFive(),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Utils.like(() {
                                                        Utils.logger
                                                            .i("Pressed like");
                                                      }),
                                                      Utils
                                                          .getSizedBoxWidthFive(),
                                                      //   add the number of likes from db
                                                      Utils.textHeader(
                                                        "0",
                                                        10,
                                                        FontWeight.normal,
                                                        MyColor
                                                            .primaryTextColor,
                                                      ),
                                                    ],
                                                  ),
                                                  Utils.getSizedBoxHeight(),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Utils.textHeader(
                                                              "R${product.newPrice}",
                                                              constraints.maxWidth <=
                                                                      Utils
                                                                          .mobileWidth
                                                                  ? 9
                                                                  : 24 * .5,
                                                              FontWeight.normal,
                                                              MyColor
                                                                  .primaryTextColor),
                                                          Utils
                                                              .getSizedBoxWidthFive(),
                                                          Utils.textOldPrice(
                                                              "R${product.oldPrice}",
                                                              constraints.maxWidth <=
                                                                      Utils
                                                                          .mobileWidth
                                                                  ? 9
                                                                  : 24 * .5,
                                                              FontWeight.normal,
                                                              MyColor
                                                                  .primaryRedColor),
                                                        ],
                                                      ),
                                                      Utils.addToCart(
                                                        function: () {
                                                          Utils.logger
                                                              .i("add to cart");
                                                        },
                                                        iconColor: iconColor,
                                                        // Pass the dynamic icon color here
                                                        onHoverFunction:
                                                            (PointerEvent
                                                                event) {
                                                          Utils.logger.i(
                                                              "add to hover");
                                                          setState(() {
                                                            iconColor = MyColor
                                                                .primaryIconRedColor; // Change icon color to red on hover
                                                          });
                                                        },
                                                        onExitFunction:
                                                            (PointerEvent
                                                                event) {
                                                          Utils.logger.i(
                                                              "add to leaving hover");
                                                          setState(() {
                                                            iconColor = MyColor
                                                                .primaryIconColor; // Reset icon color to original on exit
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Container(
                              color: MyColor.backgroundColor,
                              height: screenHeight,
                              width: screenWidth,
                              child: Center(
                                child: Utils.textHeader(
                                    'No products available.',
                                    10,
                                    FontWeight.bold,
                                    MyColor.primaryTextColor),
                              ),
                            );
                    } else if (state is MenFailure) {
                      return Center(
                        child: Utils.textHeader(state.error, 10,
                            FontWeight.bold, MyColor.primaryTextColor),
                      );
                    } else {
                      return Center(
                        child: Utils.textHeader('No products available.', 10,
                            FontWeight.bold, MyColor.primaryTextColor),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
