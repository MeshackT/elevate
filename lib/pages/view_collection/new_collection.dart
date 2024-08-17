import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme_utils/theme_utils.dart';
import '../../utils/utils.dart';
import 'newcollection_bloc.dart';

class NewCollection extends StatelessWidget {
  const NewCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.backgroundColor,
        title: Utils.textHeader(
            'My Collections', 14, FontWeight.w600, MyColor.primaryTextColor),
      ),
      body: BlocProvider(
        create: (_) => NewcollectionBloc()..add(LoadNewcollections()),
        child: BlocBuilder<NewcollectionBloc, NewcollectionState>(
          builder: (context, state) {
            if (state is ViewNewCollectionsLoading) {
              return Center(child: Utils.loadingIcon());
            } else if (state is ViewNewCollectionsLoaded) {
              final products = state.collection;

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  Utils.logger.i("${product.name}\n${product.image.first}");

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
                          Text(product.name),
                          Utils.getSizedBoxHeightFive(),
                          Utils.textHeader("${product.category}", 13,
                              FontWeight.w400, MyColor.primaryTextColor),
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
                              .read<NewcollectionBloc>()
                              .add(DeleteNewcollection(product.id));
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (state is ViewNewCollectionsError) {
              return Center(child: Text(state.message));
            } else {
              return Center(
                  child: Utils.textHeader('No collections available.', 14,
                      FontWeight.w400, MyColor.secondaryTextColor));
            }
          },
        ),
      ),
    );
  }
}
