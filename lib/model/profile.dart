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

  const Profile({this.name, this.plate, this.vehicle, this.frame, this.engine, this.ovd, this.saldo, this.finance, this.address, this.number});

  Profile.fromList(List<dynamic> list)
    : name = list[0],
      plate = list[1],
      vehicle = list[2].toString(),
      frame = list[3].toString(),
      engine = list[4].toString(),
      ovd = list[5].toString(),
      saldo = list[6].toString(),
      finance = list[7],
      address = list[8].toString(),
      number = list[9].toString();

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
  };
}