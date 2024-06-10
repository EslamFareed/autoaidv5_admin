import 'package:autoaidv5_admin/core/utils/navigation_helper.dart';
import 'package:autoaidv5_admin/cubits/carCenter/car_center_cubit.dart';
import 'package:autoaidv5_admin/cubits/services/services_cubit.dart';
import 'package:autoaidv5_admin/screens/add_new_car_center_screen.dart';
import 'package:autoaidv5_admin/screens/add_new_services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarCentersScreen extends StatelessWidget {
  const CarCentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CarCenterCubit.get(context).getData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationHelper.goTo(context, AddNewCarCenterScreen());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text("Car Centers")),
      body: BlocBuilder<CarCenterCubit, CarCenterState>(
        builder: (context, state) {
          if (state is LoadingCarCenter) {
            return const Center(child: CircularProgressIndicator());
          }
          var list = CarCenterCubit.get(context).data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(list[index]["image"]),
                  ),
                  title: Text(list[index]["name"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(list[index]["address"]),
                      Text(list[index]["rate"]),
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
