import 'package:cleanarch_bloc_demo_app/features/list/data/datasources/demo_list_datasource.dart';
import 'package:cleanarch_bloc_demo_app/features/list/presentation/bloc/demoListBloc.dart';
import 'package:cleanarch_bloc_demo_app/features/list/presentation/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => DemoListBloc(DemoListIsLoading(), DemoListDataSource()),
        child: HomePage(),
      )
    );
  }
}

