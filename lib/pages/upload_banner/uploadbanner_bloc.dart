import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate/models/banner_model.dart';
import 'package:elevate/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

part 'uploadbanner_event.dart';
part 'uploadbanner_state.dart';

class UploadbannerBloc extends Bloc<UploadbannerEvent, UploadbannerState> {
  // Store files for each index
  Uint8List? filesBanner;

  String selectedCategory = "men";

  UploadbannerBloc() : super(UploadbannerInitial()) {
    // select event
    on<SelectBannerFile>((event, emit) async {
      final result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);
      if (result != null && result.files.isNotEmpty) {
        final fileBytes = result.files.first.bytes;
        if (fileBytes != null) {
          filesBanner = fileBytes;
          Utils.logger.i("THis is the banner: \n$filesBanner");
          emit(FileBannerSelected(fileBytes, event.statusIndex));
        }
      }
    });

    // save event
    on<SaveBanner>((event, emit) async {
      if (filesBanner == null) {
        return;
      }
      emit(BannerSaving());
      try {
        final imageUrls = await Future.wait([
          uploadFile(filesBanner!, 'banner'),
        ]);

        final product = BannerModel(
          id: FirebaseFirestore.instance.collection('banners').doc().id,
          image: imageUrls.toString(),
          category: Category.values.firstWhere(
              (e) => e.toString().split('.').last == selectedCategory),
          timestamp: Timestamp.now(),
        );

        await FirebaseFirestore.instance
            .collection('banners')
            .doc(product.id)
            .set(product.toMap())
            .whenComplete(() => Utils.logger.i("banner uploaded"))
            .catchError((e) => Utils.logger.i("failed to upload banner"));
        emit(BannerSaved());
        // add(NavigateToBanner());
      } catch (e) {
        // Handle any errors that occur during the upload
        print(e);
      }
    });
  }
  // store on firebase storage
  Future<String> uploadFile(Uint8List fileBytes, String fileName) async {
    final ref = FirebaseStorage.instance.ref('banners/$fileName');
    final uploadTask = ref.putData(fileBytes);
    final snapshot = await uploadTask.whenComplete(() {});
    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
