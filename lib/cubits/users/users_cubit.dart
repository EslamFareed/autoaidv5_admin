import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  static UsersCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> data = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void getData() async {
    emit(LoadingUsers());
    try {
      var res = await firestore.collection("users").get();
      data = res.docs.map((e) => e.data()).toList();
      emit(SuccessUsers());
    } catch (e) {
      print(e.toString());
      emit(ErrorUsers());
    }
  }
}
