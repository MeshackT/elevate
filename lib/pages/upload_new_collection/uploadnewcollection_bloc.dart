import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate/models/new_collection_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/utils.dart';

part 'uploadnewcollection_event.dart';
part 'uploadnewcollection_state.dart';

class UploadnewcollectionBloc
    extends Bloc<UploadnewcollectionEvent, UploadnewcollectionState> {
  // Store files for each index
  Map<int, Uint8List?> files = {};
  // banner
  Map<int, Uint8List?> filesBanner = {};

  String selectedCategory = "men";

  TextEditingController newPrice = TextEditingController();
  TextEditingController oldPrice = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();

  UploadnewcollectionBloc() : super(UploadnewcollectionInitial()) {
    // select event
    on<SelectNewCollectionFile>((event, emit) async {
      final result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);
      if (result != null && result.files.isNotEmpty) {
        final fileBytes = result.files.first.bytes;
        if (fileBytes != null) {
          files[event.statusIndex] = fileBytes;
          emit(FileSelected(fileBytes, event.statusIndex));
        }
      }
    });

    // save event
    on<SaveNewCollection>((event, emit) async {
      if (files[1] == null ||
          files[2] == null ||
          files[3] == null ||
          files[4] == null) {
        return;
      }
      emit(NewCollectionSaving());
      try {
        final imageUrls = await Future.wait([
          uploadFile(files[1]!, 'product_image1'),
          uploadFile(files[2]!, 'product_image2'),
          uploadFile(files[3]!, 'product_image3'),
          uploadFile(files[4]!, 'product_image4')
        ]);

        final product = NewCollectionModel(
          id: FirebaseFirestore.instance.collection('products').doc().id,
          name: productName.text,
          description: productDescription.text,
          image: imageUrls,
          newPrice: double.parse(newPrice.text),
          oldPrice: double.parse(oldPrice.text),
          category: Category.values.firstWhere(
              (e) => e.toString().split('.').last == selectedCategory),
          timestamp: Timestamp.now(),
        );

        await FirebaseFirestore.instance
            .collection('newCollection')
            .doc(product.id)
            .set(product.toMap())
            .whenComplete(() => Utils.logger.i("newCollection uploaded"))
            .catchError((e) => emit(NewCollectionFailed()));
        emit(NewCollectionSaved());
        // add(NavigateToList());
      } catch (e) {
        // Handle any errors that occur during the upload
        print(e);
      }
    });
  }
  Future<String> uploadFile(Uint8List fileBytes, String fileName) async {
    final ref = FirebaseStorage.instance.ref('newCollection/$fileName');
    final uploadTask = ref.putData(fileBytes);
    final snapshot = await uploadTask.whenComplete(() {});
    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
