import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());

  static ServicesCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> data = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void getData() async {
    emit(LoadingServices());
    try {
      var res = await firestore.collection("services").get();
      data = res.docs.map((e) => e.data()).toList();
      emit(SuccessServices());
    } catch (e) {
      print(e.toString());
      emit(ErrorServices());
    }
  }

  void make(String name, String price) async {
    emit(LoadingMakeServices());
    try {
      await firestore
          .collection("services")
          .add({"name": name, "price": price});
      emit(SuccessMakeServices());
      getData();
    } catch (e) {
      print(e.toString());
      emit(ErrorMakeServices());
    }
  }
}
