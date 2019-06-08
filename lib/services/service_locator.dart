import 'package:get_it/get_it.dart';

import 'package:flutter_mata_elang/services/get_csv.dart';
import 'package:flutter_mata_elang/services/data_sql.dart';
import 'package:flutter_mata_elang/managers/csv_manager.dart';
import 'package:flutter_mata_elang/managers/sql_manager.dart';

GetIt getIt = new GetIt();

void setup() {
  getIt.registerSingleton<GetCsv>(new GetCsv());
  getIt.registerSingleton<DataSql>(new DataSql());

  getIt.registerSingleton<SqlManager>(new SqlManager());
  getIt.registerSingleton<CsvManager>(new CsvManager());
}