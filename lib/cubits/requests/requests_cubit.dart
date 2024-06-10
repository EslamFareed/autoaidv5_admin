import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit() : super(RequestsInitial());
  
  static RequestsCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> data = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void getData() async {
    emit(LoadingRequests());
    try {
      var res = await firestore.collection("requests").get();
      data = res.docs.map((e) => e.data()).toList();
      emit(SuccessRequests());
    } catch (e) {
      print(e.toString());
      emit(ErrorRequests());
    }
  }
}
