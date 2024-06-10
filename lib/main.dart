import 'package:autoaidv5_admin/cubits/carCenter/car_center_cubit.dart';
import 'package:autoaidv5_admin/cubits/complaints/complaints_cubit.dart';
import 'package:autoaidv5_admin/cubits/requests/requests_cubit.dart';
import 'package:autoaidv5_admin/cubits/services/services_cubit.dart';
import 'package:autoaidv5_admin/cubits/users/users_cubit.dart';
import 'package:autoaidv5_admin/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsersCubit()),
        BlocProvider(create: (context) => ComplaintsCubit()),
        BlocProvider(create: (context) => CarCenterCubit()),
        BlocProvider(create: (context) => RequestsCubit()),
        BlocProvider(create: (context) => ServicesCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
