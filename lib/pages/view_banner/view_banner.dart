import 'package:elevate/pages/view_banner/viewbanner_bloc.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewBanner extends StatefulWidget {
  const ViewBanner({super.key});

  @override
  State<ViewBanner> createState() => _ViewBannerState();
}

class _ViewBannerState extends State<ViewBanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.backgroundColor,
        title: Utils.textHeader(
            'My Banners', 14, FontWeight.w600, MyColor.primaryTextColor),
      ),
      body: BlocProvider(
        create: (_) => ViewbannerBloc()..add(LoadBanner()),
        child: BlocBuilder<ViewbannerBloc, ViewbannerState>(
          builder: (context, state) {
            if (state is ViewBannersLoading) {
              return Center(child: Utils.loadingIcon());
            } else if (state is ViewBannersLoaded) {
              final products = state.banners;

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  Utils.logger
                      .i("${product.category}\n${product.image.toString()}");

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: MyColor.backgroundBlackColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(product.category.toString()),
                          Utils.getSizedBoxHeightFive(),
                          Utils.textHeader("${product.category}", 13,
                              FontWeight.w400, MyColor.primaryTextColor),
                        ],
                      ),
                      leading: product.image.isNotEmpty
                          ? SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                product.image.toString(),
                                fit: BoxFit.cover,
                              ),
                            )
                          : null,
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<ViewbannerBloc>()
                              .add(DeleteBanner(product.id));
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (state is ViewBannersError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No banner available.'));
            }
          },
        ),
      ),
    );
  }
}
