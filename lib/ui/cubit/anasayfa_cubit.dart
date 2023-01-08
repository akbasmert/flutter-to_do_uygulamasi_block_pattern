

import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:to_do_uygulamasi_block_pattern/data/entity/to_do.dart';
import 'package:to_do_uygulamasi_block_pattern/data/repo/to_do_dao_repository.dart';

class AnasayfaCubit extends Cubit<List<ToDo>>{
  AnasayfaCubit():super(<ToDo>[]);

  var krepo = ToDoDaoRepo();
  Future<void> NotlariYukle()async{
    var liste = await krepo.NotlariYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi)async{

    var liste = await krepo.ara(aramaKelimesi);
    emit(liste);


  }

  Future<void>sil(int id)async{
    await krepo.sil(id);
    await NotlariYukle();
  }

}