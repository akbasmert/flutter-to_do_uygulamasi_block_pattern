import 'package:flutter/material.dart';
import 'package:to_do_uygulamasi_block_pattern/ui/cubit/anasayfa_cubit.dart';
import 'package:to_do_uygulamasi_block_pattern/ui/cubit/to_do_detay_cubit.dart';
import 'package:to_do_uygulamasi_block_pattern/ui/cubit/to_do_kayit_cubit.dart';
import 'package:to_do_uygulamasi_block_pattern/ui/screen/anasayfa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> ToDoKayitCubit()),
        BlocProvider(create: (context)=> ToDoDetayCubit()),
        BlocProvider(create: (context)=> AnasayfaCubit()),


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Anasayfa(),
      ),
    );
  }
}

