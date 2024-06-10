part of 'complaints_cubit.dart';

@immutable
sealed class ComplaintsState {}

final class ComplaintsInitial extends ComplaintsState {}

class LoadingComplaints extends ComplaintsState{}
class SuccessComplaints extends ComplaintsState{}
class ErrorComplaints extends ComplaintsState{}