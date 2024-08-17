import 'package:flutter/material.dart';

class MenPage extends StatelessWidget {
  const MenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("0"),
      ),
      // body: BlocProvider(
      //   create: (_) => MenBloc()..add(LoadProductMen()),
      //   child: BlocBuilder<MenBloc, MenState>(
      //     builder: (context, state) {
      //       if (state is MenLoading) {
      //         return Center(child: Utils.loadingIcon());
      //       }
      //       // else if (state is MenSuccess) {
      //       //   final products = state.menProducts;
      //       //
      //       //   return Column(
      //       //     crossAxisAlignment: CrossAxisAlignment.start,
      //       //     mainAxisAlignment: MainAxisAlignment.start,
      //       //     children: [
      //       //       // VIew banner
      //       //
      //       //       Utils.getSizedBoxHeight(),
      //       //       Expanded(
      //       //         flex: 1,
      //       //         child: ListView.builder(
      //       //           itemCount: products.length,
      //       //           itemBuilder: (context, index) {
      //       //             final product = products[index];
      //       //
      //       //             return Container(
      //       //               margin: const EdgeInsets.symmetric(vertical: 5),
      //       //               decoration: BoxDecoration(
      //       //                 color: MyColor.backgroundBlackColor.withOpacity(.1),
      //       //                 borderRadius: BorderRadius.circular(10),
      //       //               ),
      //       //               child: ListTile(
      //       //                 title: Column(
      //       //                   crossAxisAlignment: CrossAxisAlignment.start,
      //       //                   mainAxisAlignment: MainAxisAlignment.start,
      //       //                   children: [
      //       //                     Text(product.name),
      //       //                     Utils.getSizedBoxHeightFive(),
      //       //                     Utils.textHeader("${product.category}", 13,
      //       //                         FontWeight.w400, MyColor.primaryTextColor),
      //       //                   ],
      //       //                 ),
      //       //                 subtitle: Text(product.description),
      //       //                 leading: product.image.isNotEmpty
      //       //                     ? SizedBox(
      //       //                         height: 50,
      //       //                         width: 50,
      //       //                         child: Image.network(
      //       //                           product.image.first,
      //       //                           fit: BoxFit.cover,
      //       //                         ),
      //       //                       )
      //       //                     : null,
      //       //               ),
      //       //             );
      //       //           },
      //       //         ),
      //       //       ),
      //       //     ],
      //       //   );
      //       } else if (state is MenFailure) {
      //         return Center(child: Text(state.error));
      //       } else {
      //         return const Center(child: Text('No products available.'));
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
