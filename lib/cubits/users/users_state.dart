part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}


class LoadingUsers extends UsersState{}
class SuccessUsers extends UsersState{}
class ErrorUsers extends UsersState{}