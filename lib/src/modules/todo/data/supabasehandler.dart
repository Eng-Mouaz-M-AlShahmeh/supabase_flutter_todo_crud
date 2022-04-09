// Developed by: Eng Mouaz M Shahmeh
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter_crud/src/shared/strings.dart';

class SupaBaseHandler {
  final client =
      SupabaseClient(SharedStrings.supabaseUrl, SharedStrings.supabaseKey);

  addData(String taskValue, bool statusValue) {
    client
        .from('todotable')
        .insert({'task': taskValue, 'status': statusValue}).execute();
  }

  readData() async {
    var response = await client
        .from('todotable')
        .select()
        .order('task', ascending: true)
        .execute();
    final dataList = response.data as List;
    return dataList;
  }

  updateData(int id, bool statusValue) {
    client
        .from('todotable')
        .update({'status': statusValue})
        .eq('id', id)
        .execute();
  }

  deleteData(int id) {
    client.from('todotable').delete().eq('id', id).execute();
  }
}
