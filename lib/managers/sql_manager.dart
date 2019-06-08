import 'package:rx_command/rx_command.dart';
import 'package:rx_command/rx_command_listener.dart';

import 'package:flutter_mata_elang/services/data_sql.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class SqlManager {
  RxCommand<bool, bool> switchInsert;
  RxCommand<String, String> searchQuery;
  RxCommand<List<Profile>, List<dynamic>> insertCases;
  RxCommandListener<List<Profile>, List<dynamic>> insertCasesListener;
  RxCommand<String, List<dynamic>> searchCases;
  RxCommand<void, List<dynamic>> searchNotes;
  RxCommandListener<String, List<dynamic>> searchCasesListener;
  RxCommandListener<String, String> searchQueryListener;

  SqlManager() {
    switchInsert = RxCommand.createSync<bool, bool>((b) => b);
    searchQuery = RxCommand.createSync<String, String>((s) => s);
    insertCases = RxCommand.createAsync<List<Profile>, List<dynamic>>(getIt.get<DataSql>().insertCases);
    searchCases = RxCommand.createAsync<String, List<dynamic>>(getIt.get<DataSql>().searchCases);
    searchNotes = RxCommand.createAsyncNoParam<List<dynamic>>(getIt.get<DataSql>().searchNotes);

    insertCasesListener = RxCommandListener(
      insertCases,
      onIsBusyChange: switchInsert,
      onValue: (data) => print(data.length),
    );

    searchCasesListener = RxCommandListener(
      searchCases,
      onValue: (data) => print(data.length),
    );

    searchQueryListener = RxCommandListener(
      searchQuery,
      debounceDuration: Duration(milliseconds: 500),
      onValue: (val) => (val.isEmpty) ? print('empty query') : searchCases.execute(val)
    );
  }
}