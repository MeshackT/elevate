import 'package:elevate/pages/women_page/women_bloc.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';
import '../banner_view/banner_view.dart';

class WomenPage extends StatefulWidget {
  const WomenPage({super.key});

  @override
  State<WomenPage> createState() => _WomenPageState();
}

class _WomenPageState extends State<WomenPage> {
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
                "Women", 10, FontWeight.bold, MyColor.primaryTextColor),
          ),
          backgroundColor: MyColor.backgroundColor,
          body: BlocProvider(
            create: (_) => WomenBloc()..add(LoadProductWomen()),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BannerView(category: 'women'),
                  BlocBuilder<WomenBloc, WomenState>(
                    builder: (context, state) {
                      if (state is WomenLoading) {
                        return Center(child: Utils.loadingIcon());
                      } else if (state is WomenSuccess) {
                        final products = state.womenProducts;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: screenHeight,
                            width: screenWidth, // Adjust height as needed
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    2, // Number of columns in the grid
                                crossAxisSpacing: 1.0,
                                mainAxisSpacing: 2.0,
                                // Adjusts the aspect ratio of each item
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                Utils.logger
                                    .i("Size of list: ${products.length}");

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
                                                borderRadius: const BorderRadius
                                                    .vertical(
                                                    top: Radius.circular(10)),
                                                child: Image.network(
                                                  product.image[index],

                                                  fit: BoxFit
                                                      .scaleDown, // Change to contain to ensure the image fits within the container
                                                  width: double
                                                      .infinity, // Ensure width is set to fill the container
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Utils.textHeader(
                                                  product.name,
                                                  constraints.maxWidth <=
                                                          Utils.mobileWidth
                                                      ? 10
                                                      : 24 * .5,
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
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Utils.like(() {
                                                    Utils.logger
                                                        .i("Pressed like");
                                                  }),
                                                  Utils.getSizedBoxWidthFive(),
                                                  //   add the number of likes from db
                                                  Utils.textHeader(
                                                    "0",
                                                    9,
                                                    FontWeight.normal,
                                                    MyColor.primaryTextColor,
                                                  ),
                                                ],
                                              ),
                                              Utils.getSizedBoxHeight(),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                    iconColor:
                                                        iconColor, // Pass the dynamic icon color here
                                                    onHoverFunction:
                                                        (PointerEvent event) {
                                                      Utils.logger
                                                          .i("add to hover");
                                                      setState(() {
                                                        iconColor = MyColor
                                                            .primaryIconRedColor; // Change icon color to red on hover
                                                      });
                                                    },
                                                    onExitFunction:
                                                        (PointerEvent event) {
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
                        );
                      } else if (state is WomenFailure) {
                        return Center(
                            child: Text(
                          state.error,
                          style: TextStyle(
                              fontSize:
                                  constraints.maxWidth <= Utils.mobileWidth
                                      ? 24 * .9
                                      : 24 * .5),
                        ));
                      } else {
                        return Center(
                          child: Text(
                            'No products available.',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: MyColor.primaryRedColor),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.backgroundColor,
          title: Utils.textHeader(
            "Women",
            10,
            FontWeight.bold,
            MyColor.primaryTextColor,
          ),
        ),
        backgroundColor: MyColor.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const BannerView(category: 'women'),
              BlocProvider(
                create: (_) => WomenBloc()..add(LoadProductWomen()),
                child: BlocBuilder<WomenBloc, WomenState>(
                  builder: (context, state) {
                    if (state is WomenLoading) {
                      return Center(child: Utils.loadingIcon());
                    } else if (state is WomenSuccess) {
                      final products = state.womenProducts;

                      return Padding(
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                width: screenWidth,
                                color: MyColor.backgroundColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: product.image.isNotEmpty
                                          ? ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      top: Radius.circular(10)),
                                              child: Image.network(
                                                product.image[index],

                                                fit: BoxFit
                                                    .scaleDown, // Change to contain to ensure the image fits within the container
                                                width: double
                                                    .infinity, // Ensure width is set to fill the container
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
                                        padding: const EdgeInsets.all(8.0),
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
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Utils.like(() {
                                                  Utils.logger
                                                      .i("Pressed like");
                                                }),
                                                Utils.getSizedBoxWidthFive(),
                                                //   add the number of likes from db
                                                Utils.textHeader(
                                                  "0",
                                                  10,
                                                  FontWeight.normal,
                                                  MyColor.primaryTextColor,
                                                ),
                                              ],
                                            ),
                                            Utils.getSizedBoxHeight(),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                  iconColor:
                                                      iconColor, // Pass the dynamic icon color here
                                                  onHoverFunction:
                                                      (PointerEvent event) {
                                                    Utils.logger
                                                        .i("add to hover");
                                                    setState(() {
                                                      iconColor = MyColor
                                                          .primaryIconRedColor; // Change icon color to red on hover
                                                    });
                                                  },
                                                  onExitFunction:
                                                      (PointerEvent event) {
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
                      );
                    } else if (state is WomenFailure) {
                      return Center(
                          child: Text(
                        state.error,
                        style: TextStyle(
                            fontSize: 10, color: MyColor.primaryTextColor),
                      ));
                    } else {
                      return Center(
                        child: Text(
                          'No products available.',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: MyColor.primaryRedColor),
                        ),
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

// body: BlocProvider(
//   create: (_) => WomenBloc()..add(LoadProductWomen()),
//   child: BlocBuilder<WomenBloc, WomenState>(
//     builder: (context, state) {
//       if (state is WomenLoading) {
//         return Center(child: Utils.loadingIcon());
//       } else if (state is WomenSuccess) {
//         final products = state.womenProducts;
//
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GridView.builder(
//             gridDelegate:
//                 const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 4, // Number of columns in the grid
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//               // Adjusts the aspect ratio of each item
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               Utils.logger.i("Size of list:  ${products.length}");
//
//               return SizedBox(
//                 height: screenHeight / 2,
//                 width: screenWidth / 5,
//                 child: Card(
//                   elevation: 4.0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: product.image.isNotEmpty
//                             ? ClipRRect(
//                                 borderRadius:
//                                     const BorderRadius.vertical(
//                                         top: Radius.circular(10)),
//                                 child: Image.network(
//                                   product.image[index],
//                                   fit: BoxFit.fill,
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                 ),
//                               )
//                             : Container(
//                                 color: Colors.grey[200],
//                                 width: double.infinity,
//                               ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment:
//                               CrossAxisAlignment.start,
//                           children: [
//                             Utils.textHeader(
//                                 product.name,
//                                 constraints.maxWidth <= 600
//                                     ? 24 * .9
//                                     : 24 * .5,
//                                 FontWeight.bold,
//                                 MyColor.primaryTextColor),
//                             Utils.getSizedBoxHeightFive(),
//                             Utils.textHeader(
//                                 product.category.toString(),
//                                 constraints.maxWidth <= 600
//                                     ? 24 * .9
//                                     : 24 * .5,
//                                 FontWeight.normal,
//                                 MyColor.primaryTextColor),
//                             Utils.getSizedBoxHeightFive(),
//                             Utils.textHeader(
//                                 product.description,
//                                 constraints.maxWidth <= 600
//                                     ? 24 * .9
//                                     : 24 * .5,
//                                 FontWeight.normal,
//                                 MyColor.primaryTextColor),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       } else if (state is WomenFailure) {
//         return Center(
//             child: Text(
//           state.error,
//           style: TextStyle(
//               fontSize:
//                   constraints.maxWidth <= 600 ? 24 * .9 : 24 * .5),
//         ));
//       } else {
//         return Center(
//             child: Text(
//           'No products available.',
//           style: TextStyle(
//               fontSize:
//                   constraints.maxWidth <= 600 ? 24 * .9 : 24 * .5),
//         ));
//       }
//     },
//   ),
// ),
