import 'dart:typed_data';

import 'package:elevate/pages/upload_banner/uploadbanner_bloc.dart';
import 'package:elevate/pages/view_banner/viewbanner_bloc.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../upload_images/upload_bloc.dart';

class UploadBanner extends StatefulWidget {
  const UploadBanner({Key? key}) : super(key: key);

  @override
  State<UploadBanner> createState() => _UploadBannerState();
}

class _UploadBannerState extends State<UploadBanner> {
  bool _isHovering = false;
  TextEditingController text = TextEditingController();
  FocusNode myFocusNode = FocusNode();

  void _onHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<UploadbannerBloc>(context).myFocusNode.requestFocus();
    myFocusNode.requestFocus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // var focusNode = BlocProvider.of<UploadbannerBloc>(context).myFocusNode;
    // focusNode.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<UploadbannerBloc, UploadbannerState>(
      listener: (context, state) {
        if (state is BannerSaving) {
          //   show the loader
          setState(() {});
          Utils.loadingIcon();
        } else if (state is BannerSaved) {
          // pop the icon loading
          Navigator.of(context).pop();
        }
      },
      child: Container(
        color: MyColor.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.textHeader("Upload your banner", 15, FontWeight.bold,
                MyColor.primaryTextColor),
            Utils.getSizedBoxHeight(),
            buildImagePicker(1),
            SizedBox(
              height: 1,
              width: 1,
              child: TextFormField(
                focusNode: myFocusNode,
                // BlocProvider.of<UploadbannerBloc>(context).myFocusNode,
                controller: text,
              ),
            ),
            Utils.getSizedBoxHeight(),
            Container(
              decoration: BoxDecoration(
                color: MyColor.backgroundBlackColor.withOpacity(.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 10, top: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Utils.textHeader("Select category", 13,
                              FontWeight.bold, MyColor.primaryTextColor),
                          DropdownButton<String>(
                            iconDisabledColor: MyColor.tertiaryIconColor,
                            iconEnabledColor: MyColor.secondaryIconColor,
                            dropdownColor: MyColor.backgroundColor,
                            value: context.read<UploadBloc>().selectedCategory,
                            items: <String>['men', 'women', 'kids']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Utils.textHeader(value, 14,
                                    FontWeight.bold, MyColor.primaryTextColor),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                context
                                    .read<UploadbannerBloc>()
                                    .selectedCategory = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Utils.getSizedBoxHeightFive(),
            MouseRegion(
              onHover: (_) => _onHover(true),
              onExit: (_) => _onHover(false),
              child: GestureDetector(
                onTap: () {
                  context.read<UploadbannerBloc>().add(SaveBanner());
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: _isHovering
                        ? MyColor.backgroundBlackColor
                        : MyColor.backgroundColor,
                    border: Border.all(
                      color: MyColor.backgroundBlackColor,
                      width: 1.0, // You can change the width as needed
                    ),
                    borderRadius: BorderRadius.circular(
                        10), // Optional, for rounded corners
                  ),
                  child: BlocBuilder<ViewbannerBloc, ViewbannerState>(
                    builder: (context, state) {
                      if (state is LoadBanner) {
                        return Center(child: Utils.loadingIcon());
                      }
                      return Center(
                        child: Utils.textHeader(
                            "Save Banner",
                            14,
                            FontWeight.bold,
                            _isHovering
                                ? MyColor.primaryWhiteTextColor
                                : MyColor.primaryTextColor),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // upload_images.dart
  Widget buildImagePicker(int statusIndex) {
    return GestureDetector(
      onTap: () {
        context.read<UploadbannerBloc>().add(SelectBannerFile(statusIndex));
        // BlocProvider.of<UploadbannerBloc>(context).myFocusNode.requestFocus();
        myFocusNode.requestFocus();
      },
      child: BlocBuilder<UploadBloc, UploadState>(
        builder: (context, state) {
          Uint8List? file = context.read<UploadBloc>().files[statusIndex];

          return Container(
            margin: const EdgeInsets.only(right: 20),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
              image: file != null
                  ? DecorationImage(image: MemoryImage(file), fit: BoxFit.cover)
                  : null,
            ),
            child: file == null
                ? Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: MyColor.backgroundBlackColor.withOpacity(.2),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: MyColor.backgroundColor,
                      child: Icon(
                        Icons.photo_camera,
                        size: 50,
                        color: MyColor.backgroundBlackColor,
                      ),
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }

  // upload_images.dart
  Widget buildImageBannerPicker(int statusIndex) {
    return GestureDetector(
      onTap: () {
        context.read<UploadbannerBloc>().add(SelectBannerFile(statusIndex));
      },
      child: BlocBuilder<UploadBloc, UploadState>(
        builder: (context, state) {
          Uint8List? file = context.read<UploadbannerBloc>().filesBanner;

          return Container(
            margin: const EdgeInsets.only(right: 20),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
              image: file != null
                  ? DecorationImage(image: MemoryImage(file), fit: BoxFit.cover)
                  : null,
            ),
            child: file == null
                ? Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: MyColor.backgroundBlackColor.withOpacity(.2),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: MyColor.backgroundColor,
                      child: Icon(
                        Icons.photo_camera,
                        size: 50,
                        color: MyColor.backgroundBlackColor,
                      ),
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }
}
