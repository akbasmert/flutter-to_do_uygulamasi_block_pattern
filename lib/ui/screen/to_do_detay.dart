
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_uygulamasi_block_pattern/data/entity/to_do.dart';
import 'package:to_do_uygulamasi_block_pattern/ui/cubit/to_do_detay_cubit.dart';

class ToDoDetay extends StatefulWidget {
  ToDo not;
  ToDoDetay({required this.not});

  @override
  State<ToDoDetay> createState() => _ToDoDetayState();
}

class _ToDoDetayState extends State<ToDoDetay> {
  var tfKisiAd = TextEditingController();

  @override
  void initState() {
    super.initState();
    var not = widget.not;
    tfKisiAd.text = not.name as String;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Not Detay"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfKisiAd,
                decoration: const InputDecoration(hintText: "Not:"),
              ),
              ElevatedButton(onPressed: (){
               context.read<ToDoDetayCubit>().guncelle(widget.not.id, tfKisiAd.text);
              },
                child: Text("Guncelle"),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
