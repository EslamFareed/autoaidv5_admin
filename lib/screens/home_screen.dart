import 'package:autoaidv5_admin/screens/car_center_screen.dart';
import 'package:autoaidv5_admin/screens/complaints_screen.dart';
import 'package:autoaidv5_admin/screens/requests_screen.dart';
import 'package:autoaidv5_admin/screens/services_screen.dart';
import 'package:autoaidv5_admin/screens/users_screen.dart';
import 'package:flutter/material.dart';

import '../core/utils/navigation_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const UsersScreen());
              },
              title: const Text("Users"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const ComplaintsScreen());
              },
              title: const Text("Complaints"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const RequestsScreen());
              },
              title: const Text("Requests"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const ServicesScreen());
              },
              title: const Text("Services"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const CarCentersScreen());
              },
              title: const Text("Car Centers"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
