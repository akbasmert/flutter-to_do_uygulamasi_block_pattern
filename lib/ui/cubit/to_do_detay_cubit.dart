
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:to_do_uygulamasi_block_pattern/data/repo/to_do_dao_repository.dart';

class ToDoDetayCubit extends Cubit<void>{
  ToDoDetayCubit():super(0);

  var krepo = ToDoDaoRepo();

  Future<void> guncelle(int id, String name)async{
    await krepo.guncelle(id, name);
  }

}