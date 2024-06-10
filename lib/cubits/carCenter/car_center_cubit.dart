import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'car_center_state.dart';

class CarCenterCubit extends Cubit<CarCenterState> {
  CarCenterCubit() : super(CarCenterInitial());

  static CarCenterCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> data = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void getData() async {
    emit(LoadingCarCenter());
    try {
      var res = await firestore.collection("carCenter").get();
      data = res.docs.map((e) => e.data()).toList();
      emit(SuccessCarCenter());
    } catch (e) {
      print(e.toString());
      emit(ErrorCarCenter());
    }
  }

  void make(String name, String address, String rate, XFile image) async {
    emit(LoadingMakeCarCenter());
    try {
      String imageString = "";
      final storageRef = FirebaseStorage.instance.ref();
      final mountainImagesRef = storageRef.child("images/${image.name}");
      try {
        var response = await mountainImagesRef.putFile(File(image.path));

        imageString = await response.ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
        emit(ErrorMakeCarCenter());
      }
      await firestore.collection("carCenter").add({
        "image": imageString,
        "name": name,
        "rate": rate,
        "address": address,
      });
      emit(SuccessMakeCarCenter());
      getData();
    } catch (e) {
      print(e.toString());
      emit(ErrorMakeCarCenter());
    }
  }
}
