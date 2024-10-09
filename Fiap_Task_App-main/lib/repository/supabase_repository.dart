import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/models/task_group.dart';

//classe para acessar bd
class SupabaseRepository {

  Future<List<TaskGroup>> listTaskGroups() async{
    final client = Supabase.instance.client;
    final response = await client.from('task_groups').select();

    //converter obj por obj
    //map p mapear a lista, p cada map ira converter em lista, msm q for, retorna lista de taskgroup
    final taskGroups = response.map((m) => TaskGroup.fromMap(m)).toList();
    return taskGroups;
  }

  //provider p intermediar acesso a dados
}