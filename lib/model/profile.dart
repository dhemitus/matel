/**
 name: OGI NUGRAHA,
 plate: B1001SL,
 vehicle: HONDA ODYSSEY 23 CBU,
 frame: RA61222085,
 engine: F23A2427192,
 ovd: ,
 sald: 45508579,
 finance: BPR KS (081218784446),
 address: BANDUNG,
 number: 12
 * 
 */

class Profile {
  int id;
  final String name;
  final String plate;
  final String vehicle;
  final String frame;
  final String engine;
  final String ovd;
  final String saldo;
  final String finance;
  final String address;
  final String number;
  final String phone;
  final String date;
  String note;

  Profile({this.name, this.plate, this.vehicle, this.frame, this.engine, this.ovd, this.saldo, this.finance, this.address, this.number, this.phone, this.date, this.note});
  Profile.withId({this.id, this.name, this.plate, this.vehicle, this.frame, this.engine, this.ovd, this.saldo, this.finance, this.address, this.number, this.phone, this.date, this.note});

  Profile.fromList(List<dynamic> list)
    : name = list[0],
      plate = (list[1] == null) ? '' : list[1].replaceAll(' ', ''),
      vehicle = list[2].toString(),
      frame = (list[3] == null) ? '' : list[3].toString().replaceAll(' ', ''),
      engine = (list[4] == null) ? '' : list[4].toString().replaceAll(' ', ''),
      ovd = list[5].toString(),
      saldo = list[6].toString(),
      finance = list[7],
      address = list[8].toString(),
      number = list[9].toString(),
      phone = '',
      date = '',
      note = '';

  Map<String, String> toJson() => {
    'name': name,
    'plate': plate,
    'vehicle': vehicle,
    'frame': frame,
    'engine': engine,
    'ovd': ovd,
    'saldo': saldo,
    'finance': finance,
    'address': address,
    'number': number,
    'phone': phone,
    'date': date,
    'note': note,
  };

  Map<String, dynamic> toMap() {
    Map<String, dynamic> _map = new Map<String, dynamic>();

    if(id != null) {
      _map['id'] = id;
    }
    _map['name'] = name;
    _map['plate'] = plate;
    _map['vehicle'] = vehicle;
    _map['frame'] = frame;
    _map['engine'] = engine;
    _map['ovd'] = ovd;
    _map['saldo'] = saldo;
    _map['finance'] = finance;
    _map['address'] = address;
    _map['number'] = number;
    _map['phone'] = phone;
    _map['date'] = date;
    _map['note'] = note;

    return _map;
  }

  Profile.fromMap(Map<String, dynamic> map) 
    : id = map['id'],
      name = (map['name'] == null) ? '' : map['name'],
      plate = (map['plate'] == null) ? '' : map['plate'].replaceAll(' ', ''),
      vehicle = map['vehicle'],
      frame = (map['frame'] == null) ? '' :map['frame'].replaceAll(' ', ''),
      engine = (map['engine'] == null) ? '' :map['engine'].replaceAll(' ', ''),
      ovd = (map['ovd'] == null) ? '' : map['ovd'],
      saldo = (map['saldo'] == null) ? '' : map['saldo'],
      finance = (map['finance'] == null) ? '' : map['finance'],
      address = (map['address'] == null) ? '' : map['address'],
      number = (map['number'] == null) ? '' : map['number'],
      phone = (map['phone'] == null) ? '' : map['phone'],
      date = (map['date'] == null) ? '' : map['date'],
      note = (map['note'] == null) ? '' : map['note'];
}