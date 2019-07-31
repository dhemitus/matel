class User {
  final String email;
  final String password;
  String imei;

  User({this.email, this.password});
  Map<String, dynamic> toMap() {
    Map<String, dynamic> _map = new Map<String, dynamic>();

    _map['email'] = email;
    _map['password'] = password;
    _map['imei'] = imei;
    return _map;
  }
}

class Register {
  final String date;
  final String email;
  final String password;
  final String noktp;
  final String fotoktp;
  final String fotoselfi;
  final String nama;
  final String nohp;
  final String alamat;
  final String agency_id;
  String fcmid;
  String imei;
//  dynamic selfie;
//  dynamic ktp;

  Register({this.date, this.email, this.password, this.noktp, this.fotoktp, this.fotoselfi, this.nama, this.nohp, this.alamat, this.agency_id});
  Map<String, dynamic> toMap() {
    Map<String, dynamic> _map = new Map<String, dynamic>();

//    _map['date'] = date;
    _map['email'] = email;
    _map['password'] = password;
    _map['noktp'] = noktp;
    _map['fotoktp'] = fotoktp;
    _map['fotoselfi'] = fotoselfi;
    _map['nama'] = nama;
    _map['nohp'] = nohp;
    _map['alamat'] = alamat;
    _map['fcmid'] = fcmid;
    _map['agency_id'] = agency_id;
    _map['imei'] = imei;
    return _map;
  }

}