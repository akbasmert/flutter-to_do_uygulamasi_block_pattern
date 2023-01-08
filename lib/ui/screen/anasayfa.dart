import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_uygulamasi_block_pattern/data/entity/to_do.dart';
import 'package:to_do_uygulamasi_block_pattern/ui/screen/to_do_detay.dart';
import 'package:to_do_uygulamasi_block_pattern/ui/screen/to_do_kayit.dart';

import '../cubit/anasayfa_cubit.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().NotlariYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(decoration: InputDecoration(hintText:  "Ara"),
          onChanged: (aramaSonucu){
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          },
        ) :
        Text("Notlar"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
            context.read<AnasayfaCubit>().NotlariYukle();
          },
            icon: const Icon(Icons.clear),
          ) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          },
            icon: const Icon(Icons.search),
          ) ,
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<ToDo>>(

        builder: (context, toDolistesi){
          if(toDolistesi.isNotEmpty){
            return ListView.builder(
              itemCount: toDolistesi.length,
              itemBuilder:  (context,indeks){
                var not = toDolistesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ToDoDetay(not: not)))
                        .then((value) { context.read<AnasayfaCubit>().NotlariYukle();});
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Text("${not.name} "),
                        Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content:
                              Text("${not.name} silinsinmi?"),
                                action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: (){
                                    context.read<AnasayfaCubit>().sil(not.id)
                                        .then((value){
                                      context.read<AnasayfaCubit>().NotlariYukle();
                                    });

                                  },
                                ),
                              )
                          );
                        }, icon: Icon(Icons.delete_forever_outlined, color: Colors.black54,),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{//asfasf
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => ToDoKayit() ))
              .then((value){
            context.read<AnasayfaCubit>().NotlariYukle();
          });

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
