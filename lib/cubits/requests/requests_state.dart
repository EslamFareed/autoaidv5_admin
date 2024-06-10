part of 'requests_cubit.dart';

@immutable
sealed class RequestsState {}

final class RequestsInitial extends RequestsState {}

class LoadingRequests extends RequestsState{}
class SuccessRequests extends RequestsState{}
class ErrorRequests extends RequestsState{}