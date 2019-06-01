import 'package:get_it/get_it.dart';

import 'package:flutter_mata_elang/services/get_csv.dart';
import 'package:flutter_mata_elang/managers/csv_manager.dart';

GetIt getIt = new GetIt();

void setup() {
  getIt.registerSingleton<GetCsv>(new GetCsv());

  getIt.registerSingleton<CsvManager>(new CsvManager());
}