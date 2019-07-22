import 'package:get_it/get_it.dart';

import 'package:flutter_mata_elang/services/get_csv.dart';
import 'package:flutter_mata_elang/services/cfg_data.dart';
import 'package:flutter_mata_elang/services/loc_data.dart';
import 'package:flutter_mata_elang/services/data_sql.dart';
import 'package:flutter_mata_elang/services/get_auth.dart';
import 'package:flutter_mata_elang/managers/csv_manager.dart';
import 'package:flutter_mata_elang/managers/cfg_manager.dart';
import 'package:flutter_mata_elang/managers/sql_manager.dart';
import 'package:flutter_mata_elang/managers/blk_manager.dart';
import 'package:flutter_mata_elang/managers/auth_manager.dart';

GetIt getIt = new GetIt();

void setup() {
  getIt.registerSingleton<CfgData>(new CfgData());
  getIt.registerSingleton<LocData>(new LocData());
  getIt.registerSingleton<GetCsv>(new GetCsv());
  getIt.registerSingleton<DataSql>(new DataSql());
  getIt.registerSingleton<GetAuth>(new GetAuth());

  getIt.registerSingleton<SqlManager>(new SqlManager());
  getIt.registerSingleton<BlkManager>(new BlkManager());
  getIt.registerSingleton<CsvManager>(new CsvManager());
  getIt.registerSingleton<CfgManager>(new CfgManager());
  getIt.registerSingleton<AuthManager>(new AuthManager());
}