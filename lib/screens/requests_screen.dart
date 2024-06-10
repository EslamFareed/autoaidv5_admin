import 'package:autoaidv5_admin/cubits/requests/requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RequestsCubit.get(context).getData();
    return Scaffold(
      appBar: AppBar(title: const Text("Requests")),
      body: BlocBuilder<RequestsCubit, RequestsState>(
        builder: (context, state) {
          if (state is LoadingRequests) {
            return const Center(child: CircularProgressIndicator());
          }
          var list = RequestsCubit.get(context).data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  // title: Text(list[index]["user"]["name"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Request : " +
                          list[index]["userRequestInfo"]["name"]),
                      Text("User Request : " +
                          list[index]["userRequestInfo"]["phone"]),
                      Text("Provider : " + list[index]["providerInfo"]["name"]),
                      Text(
                          "Provider : " + list[index]["providerInfo"]["phone"]),
                      Text("Status : " + list[index]["status"]),
                      ...(list[index]["servcies"] as List)
                          .map((e) => Text("${e["name"]} - ${e["price"]}"))
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
