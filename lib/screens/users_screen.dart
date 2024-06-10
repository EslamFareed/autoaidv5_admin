import 'package:autoaidv5_admin/cubits/users/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersCubit.get(context).getData();
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is LoadingUsers) {
            return const Center(child: CircularProgressIndicator());
          }
          var list = UsersCubit.get(context).data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(list[index]["name"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(list[index]["email"]),
                      Text(list[index]["phone"]),
                    ],
                  ),
                ),
              );
            },
            itemCount: list.length,
          );
        },
      ),
    );
  }
}
