import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  ComplaintsCubit() : super(ComplaintsInitial());

  static ComplaintsCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> data = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void getData() async {
    emit(LoadingComplaints());
    try {
      var res = await firestore.collection("complaints").get();
      data = res.docs.map((e) => e.data()).toList();
      emit(SuccessComplaints());
    } catch (e) {
      print(e.toString());
      emit(ErrorComplaints());
    }
  }
}
