import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'banner_view_bloc.dart';

class BannerView extends StatelessWidget {
  final String category;

  const BannerView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerViewBloc()..add(LoadBannerEvent(category)),
      child: BlocBuilder<BannerViewBloc, BannerViewState>(
        builder: (context, state) {
          if (state is BannerViewInitial) {
            return Center(child: Utils.loadingIcon());
          } else if (state is BannerLoaded) {
            return Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 20.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: Image.asset(
                state.banner,
                fit: BoxFit.contain,
              ),
            );
          } else {
            return Center(
              child: Utils.textHeader("Failed to load banner", 10,
                  FontWeight.bold, MyColor.primaryTextColor),
            );
          }
        },
      ),
    );
  }
}
