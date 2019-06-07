import 'package:rx_command/rx_command.dart';
import 'package:rx_command/rx_command_listener.dart';

import 'package:flutter_mata_elang/services/get_csv.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class CsvManager {
  RxCommand<void, List<Profile>> loadCsv;
  RxCommandListener<void, List<Profile>> loadCsvListener;
  RxCommand<bool, bool> switchLoad;

  CsvManager() {
    switchLoad = RxCommand.createSync<bool, bool>((b) => b);
    loadCsv = RxCommand.createAsyncNoParam<List<Profile>>(getIt.get<GetCsv>().load);
    loadCsvListener = RxCommandListener(
      loadCsv,
      onIsBusyChange: switchLoad
    );
  }
}