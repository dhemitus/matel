import 'package:rx_command/rx_command.dart';

import 'package:flutter_mata_elang/services/get_csv.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class CsvManager {
  RxCommand<void, List<Profile>> loadCsv;

  CsvManager() {
    loadCsv = RxCommand.createAsyncNoParam<List<Profile>>(getIt.get<GetCsv>().load);
  }
}