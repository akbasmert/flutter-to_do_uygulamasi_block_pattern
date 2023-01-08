import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:to_do_uygulamasi_block_pattern/data/repo/to_do_dao_repository.dart';

class ToDoKayitCubit extends Cubit<void>{
  ToDoKayitCubit():super(0);

  var krepo = ToDoDaoRepo();
  Future<void> kaydet(String name)async{
    await krepo.kaydet(name);
  }
}