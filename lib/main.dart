import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/views/login_page.dart';
import 'src/blocs/authentication_bloc.dart';
import 'src/services/authentication_service.dart';
import 'database/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isLinux || Platform.isWindows || Platform.isMacOS)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseHelper databaseHelper = DatabaseHelper.instance;
    final AuthenticationService authenticationService = AuthenticationService(databaseHelper);

    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(authenticationService), // Ensure this matches the constructor in AuthenticationBloc
      child: MaterialApp(
        title: 'Flight Booking App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}