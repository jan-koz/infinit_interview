import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_interview/core/di/dependencies_container.dart';
import 'package:infinit_interview/ui/home/cubit/home_cubit.dart';
import 'package:infinit_interview/ui/home/view/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => getIt.get<HomeCubit>(),
        )
      ], child: const HomeScreen()),
    );
  }
}
