

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_uygulamasi_block_pattern/ui/cubit/to_do_kayit_cubit.dart';

class ToDoKayit extends StatefulWidget {
  const ToDoKayit({Key? key}) : super(key: key);

  @override
  State<ToDoKayit> createState() => _ToDoKayitState();
}

class _ToDoKayitState extends State<ToDoKayit> {
  var tfKisiAd = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Not Kayıt"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0,right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfKisiAd,
                decoration: const InputDecoration(hintText: "Not:"),
              ),
              ElevatedButton(onPressed: (){
                context.read<ToDoKayitCubit>().kaydet(tfKisiAd.text);
              },
                child: Text("Kaydet"),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
