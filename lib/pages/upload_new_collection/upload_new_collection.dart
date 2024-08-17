import 'dart:typed_data';

import 'package:elevate/pages/upload_new_collection/uploadnewcollection_bloc.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_collection/newcollection_bloc.dart';

class UploadNewCollection extends StatefulWidget {
  const UploadNewCollection({Key? key}) : super(key: key);

  @override
  State<UploadNewCollection> createState() => _UploadNewCollectionState();
}

class _UploadNewCollectionState extends State<UploadNewCollection> {
  FocusNode myFocusNode = FocusNode();
  bool _isHovering = false;

  void _onHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<UploadnewcollectionBloc, UploadnewcollectionState>(
      listener: (context, state) {
        if (state is NewCollectionSaving) {
          //   show the loader
          setState(() {});
          Utils.loadingIcon();
        } else if (state is NewCollectionSaved) {
          // pop the icon loading
          Navigator.of(context).pop();
        }
      },
      child: Container(
        height: screenHeight,
        color: MyColor.backgroundColor,
        width: screenWidth,
        // padding:
        //     const EdgeInsets.only(left: 60, top: 20, bottom: 20, right: 60),
        child: BlocBuilder<NewcollectionBloc, NewcollectionState>(
          builder: (context, state) {
            if (state is SaveNewCollection) {
              return Center(child: Utils.loadingIcon());
            } else if (state is NewCollectionSaved) {
              return Utils.savedIcon();
            } else if (state is FailedNewCollection) {
              return Utils.errorIcon();
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.getSizedBoxHeight(),
                  Utils.textHeader(
                      "Upload your new collection\nFirst image is you main picture",
                      15,
                      FontWeight.bold,
                      MyColor.primaryTextColor),
                  Utils.getSizedBoxHeight(),
                  // list of image pickers
                  SizedBox(
                    height: 100,
                    width: screenWidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildImagePicker(1),
                        buildImagePicker(2),
                        buildImagePicker(3),
                        buildImagePicker(4),
                      ],
                    ),
                  ),
                  Utils.getSizedBoxHeight(),
                  // text boxes
                  Container(
                    decoration: BoxDecoration(
                      color: MyColor.backgroundBlackColor.withOpacity(.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          buildTextField(
                              "Product Name",
                              context
                                  .read<UploadnewcollectionBloc>()
                                  .productName),
                          buildTextField(
                              "Product Description",
                              context
                                  .read<UploadnewcollectionBloc>()
                                  .productDescription),
                          buildTextField("New Price",
                              context.read<UploadnewcollectionBloc>().newPrice),
                          buildTextField("Old Price",
                              context.read<UploadnewcollectionBloc>().oldPrice),
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
                                  value: context
                                      .read<UploadnewcollectionBloc>()
                                      .selectedCategory,
                                  items: <String>['men', 'women', 'kids']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Utils.textHeader(
                                          value,
                                          14,
                                          FontWeight.bold,
                                          MyColor.primaryTextColor),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      context
                                          .read<UploadnewcollectionBloc>()
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
                  // save product
                  MouseRegion(
                    onHover: (_) => _onHover(true),
                    onExit: (_) => _onHover(false),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<UploadnewcollectionBloc>()
                            .add(SaveNewCollection());
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
                        child: Center(
                          child: Utils.textHeader(
                              "Save New Collection",
                              14,
                              FontWeight.bold,
                              _isHovering
                                  ? MyColor.primaryWhiteTextColor
                                  : MyColor.primaryTextColor),
                        ),
                      ),
                    ),
                  ),
                  Utils.getSizedBoxHeight(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // upload_images.dart
  Widget buildImagePicker(int statusIndex) {
    return GestureDetector(
      onTap: () {
        context
            .read<UploadnewcollectionBloc>()
            .add(SelectNewCollectionFile(statusIndex));
      },
      child: BlocBuilder<UploadnewcollectionBloc, UploadnewcollectionState>(
        builder: (context, state) {
          Uint8List? file =
              context.read<UploadnewcollectionBloc>().files[statusIndex];

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
        context
            .read<UploadnewcollectionBloc>()
            .add(SelectNewCollectionFile(statusIndex));
      },
      child: BlocBuilder<UploadnewcollectionBloc, UploadnewcollectionState>(
        builder: (context, state) {
          Uint8List? file =
              context.read<UploadnewcollectionBloc>().files[statusIndex];

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

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Utils.textHeader(
                  label, 13, FontWeight.bold, MyColor.primaryTextColor)),
          Expanded(
            flex: 2,
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                fillColor: MyColor.backgroundColor,
                filled: true,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
