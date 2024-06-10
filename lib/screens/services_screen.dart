import 'package:autoaidv5_admin/core/utils/navigation_helper.dart';
import 'package:autoaidv5_admin/cubits/services/services_cubit.dart';
import 'package:autoaidv5_admin/screens/add_new_services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ServicesCubit.get(context).getData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationHelper.goTo(context, AddNewServiceScreen());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text("Services")),
      body: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          if (state is LoadingServices) {
            return const Center(child: CircularProgressIndicator());
          }
          var list = ServicesCubit.get(context).data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(list[index]["name"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(list[index]["price"]),
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
