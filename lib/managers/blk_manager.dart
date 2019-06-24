import 'package:rx_command/rx_command.dart';
import 'package:rx_command/rx_command_listener.dart';

import 'package:flutter_mata_elang/services/data_sql.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class BlkManager {
  RxCommand<bool, bool> switchInsert;
  RxCommand<String, String> searchQuery;
  RxCommand<List<Profile>, List<dynamic>> insertBulks;
  RxCommand<Profile, Profile> selectBulk;
  RxCommand<String, List<dynamic>> searchBulks;
  RxCommand<Profile, int> updateBulk;
  RxCommandListener<List<Profile>, List<dynamic>> insertBulksListener;
  RxCommandListener<Profile, int> updateBulkListener;
  RxCommandListener<String, List<dynamic>> searchBulksListener;
  RxCommandListener<String, String> searchQueryListener;

  BlkManager() {
    switchInsert = RxCommand.createSync<bool, bool>((b) => b);
    searchQuery = RxCommand.createSync<String, String>((s) => s);
    insertBulks = RxCommand.createAsync<List<Profile>, List<dynamic>>(getIt.get<DataSql>().insertBulks);
    selectBulk = RxCommand.createAsync<Profile, Profile>(getIt.get<DataSql>().selectBulk);
    updateBulk = RxCommand.createAsync<Profile, int>(getIt.get<DataSql>().updateBulk);
    searchBulks = RxCommand.createAsync<String, List<dynamic>>(getIt.get<DataSql>().searchBulks);

    insertBulksListener = RxCommandListener(
      insertBulks,
      onIsBusyChange: switchInsert,
      onValue: (data) => print(data.length),
    );

    searchBulksListener = RxCommandListener(
      searchBulks,
      onValue: (data) => print(data.length),
    );

    searchQueryListener = RxCommandListener(
      searchQuery,
      debounceDuration: Duration(milliseconds: 500),
      onValue: (val) => searchBulks.execute(val)
    );
  }
}