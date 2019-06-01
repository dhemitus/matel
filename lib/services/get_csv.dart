import 'package:dio/dio.dart';
import 'package:csv/csv.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class GetCsv {

  Future<List<Profile>> load () async {
    const url = 'http://bprags.co.id/kasus.csv';

    Dio _dio = new Dio();
    Response<String> _data = await _dio.get<String>(url);
    List<Profile> _table = CsvToListConverter(eol: '\n').convert(_data.data).map((item) => Profile.fromList(item)).toList();
    print(_table[1].toJson());
    return _table;
  }
}