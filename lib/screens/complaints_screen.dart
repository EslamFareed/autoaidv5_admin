import 'package:autoaidv5_admin/cubits/complaints/complaints_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ComplaintsCubit.get(context).getData();
    return Scaffold(
      appBar: AppBar(title: const Text("Complaints")),
      body: BlocBuilder<ComplaintsCubit, ComplaintsState>(
        builder: (context, state) {
          if (state is LoadingComplaints) {
            return const Center(child: CircularProgressIndicator());
          }
          var list = ComplaintsCubit.get(context).data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(list[index]["user"]["name"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(list[index]["user"]["phone"]),
                      Text(list[index]["text"]),
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
