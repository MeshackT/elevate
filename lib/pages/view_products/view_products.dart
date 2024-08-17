import 'package:elevate/pages/view_products/view_products_bloc.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_banner/viewbanner_bloc.dart';
import '../view_collection/newcollection_bloc.dart';

class ViewProducts extends StatelessWidget {
  const ViewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.backgroundColor,
        title: Utils.textHeader(
            'My Products', 14, FontWeight.w600, MyColor.primaryTextColor),
      ),
      body: MultiBlocListener(
        listeners: [
          // C:\Users\Templeton\StudioProjects\elevate\lib\pages\view_banner\view_banner.dart
          BlocListener<ViewbannerBloc, ViewbannerState>(
            listener: (context, state) {
              if (state is NavigateToBannerState) {
                // move to the view banner screen
                Navigator.of(context).pushNamed('/view_banners');
              }
            },
          ),
          BlocListener<NewcollectionBloc, NewcollectionState>(
            listener: (context, state) {
              if (state is NewcollectionState) {
                // move to the view new collection screen
                Navigator.of(context).pushNamed('/view_new_collections');
              }
            },
          ),
        ],
        child: BlocProvider(
          create: (_) => ViewProductsBloc()..add(LoadProducts()),
          child: BlocBuilder<ViewProductsBloc, ViewProductsState>(
            builder: (context, state) {
              if (state is ViewProductsLoading) {
                return Center(child: Utils.loadingIcon());
              } else if (state is ViewProductsLoaded) {
                final products = state.products;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // VIew buttons
                    Utils.getSizedBoxHeight(),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        Container(
                            color: MyColor.backgroundBlackColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextButton(
                                onPressed: () {
                                  context
                                      .read<ViewbannerBloc>()
                                      .add(NavigateToBanner());
                                },
                                child: Utils.textHeader(
                                    "Banners",
                                    14,
                                    FontWeight.w400,
                                    MyColor.primaryWhiteTextColor))),
                        Utils.getSizedBoxWidthFive(),
                        Container(
                            color: MyColor.backgroundBlackColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextButton(
                                onPressed: () {
                                  context
                                      .read<NewcollectionBloc>()
                                      .add(NavigateToNewCollection());
                                },
                                child: Utils.textHeader(
                                    "New collection",
                                    14,
                                    FontWeight.w400,
                                    MyColor.primaryWhiteTextColor))),
                        Utils.getSizedBoxWidthFive(),
                      ],
                    ),
                    Utils.getSizedBoxHeight(),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          Utils.logger
                              .i("${product.name}\n${product.image.first}");

                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color:
                                  MyColor.backgroundBlackColor.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(product.name),
                                  Utils.getSizedBoxHeightFive(),
                                  Utils.textHeader(
                                      "${product.category}",
                                      13,
                                      FontWeight.w400,
                                      MyColor.primaryTextColor),
                                ],
                              ),
                              subtitle: Text(product.description),
                              leading: product.image.isNotEmpty
                                  ? SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(
                                        product.image.first,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : null,
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  context
                                      .read<ViewProductsBloc>()
                                      .add(DeleteProduct(product.id));
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is ViewProductsError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('No products available.'));
              }
            },
          ),
        ),
      ),
    );
  }
}
