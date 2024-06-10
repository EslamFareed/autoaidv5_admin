part of 'services_cubit.dart';

@immutable
sealed class ServicesState {}

final class ServicesInitial extends ServicesState {}

class LoadingServices extends ServicesState{}
class SuccessServices extends ServicesState{}
class ErrorServices extends ServicesState{}


class LoadingMakeServices extends ServicesState{}
class SuccessMakeServices extends ServicesState{}
class ErrorMakeServices extends ServicesState{}