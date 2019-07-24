import 'package:rx_command/rx_command.dart';
import 'package:rx_command/rx_command_listener.dart';

import 'package:flutter_mata_elang/services/data_sql.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class SqlManager {
  RxCommand<bool, bool> switchInsert;
  RxCommand<List<String>, List<String>> searchQuery;
  RxCommand<List<Profile>, List<dynamic>> insertCases;
  RxCommand<Profile, Profile> selectCase;
  RxCommand<List<String>, List<dynamic>> searchCases;
  RxCommand<Profile, int> insertNote;
  RxCommand<Profile, int> deleteNote;
  RxCommand<void, List<dynamic>> searchNotes;
  RxCommandListener<List<Profile>, List<dynamic>> insertCasesListener;
  RxCommandListener<Profile, int> deleteNoteListener;
  RxCommandListener<List<String>, List<dynamic>> searchCasesListener;
  RxCommandListener<List<String>, List<String>> searchQueryListener;

  SqlManager() {
    switchInsert = RxCommand.createSync<bool, bool>((b) => b);
    searchQuery = RxCommand.createSync<List<String>, List<String>>((s) => s);
    insertCases = RxCommand.createAsync<List<Profile>, List<dynamic>>(getIt.get<DataSql>().insertCases);
    selectCase = RxCommand.createAsync<Profile, Profile>(getIt.get<DataSql>().selectCase);
    insertNote = RxCommand.createAsync<Profile, int>(getIt.get<DataSql>().updateCase);
    deleteNote = RxCommand.createAsync<Profile, int>(getIt.get<DataSql>().updateCase);
    searchCases = RxCommand.createAsync<List<String>, List<dynamic>>(getIt.get<DataSql>().searchCases);
    searchNotes = RxCommand.createAsyncNoParam<List<dynamic>>(getIt.get<DataSql>().searchNotes);

    insertCasesListener = RxCommandListener(
      insertCases,
      onIsBusyChange: switchInsert,
      onValue: (data) => print(data.length),
    );

    deleteNoteListener = RxCommandListener(
      deleteNote,
      onValue: (data) => searchNotes.execute(),
    );

    searchCasesListener = RxCommandListener(
      searchCases,
      onValue: (data) => print(data.length),
    );

    searchQueryListener = RxCommandListener(
      searchQuery,
      debounceDuration: Duration(milliseconds: 500),
      onValue: (val) => (val[0].isEmpty) ? print('empty query') : searchCases.execute(val)
    );
  }
}