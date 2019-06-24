import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/managers/blk_manager.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/primary_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/text_button.dart';
import 'package:flutter_mata_elang/model/profile.dart';
import 'package:flutter_mata_elang/pages/addnote_page.dart';

class AddBulkPage extends StatefulWidget {

  AddBulkPage({Key key}) : super(key: key);

  @override
  _AddBulkPageState createState() => _AddBulkPageState();
}

class _AddBulkPageState extends State<AddBulkPage> {
//  Profile bulk;

  String _data;
  String _name;
  String _phone;
  String _date;

  TextEditingController _dataController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  //TextEditingController _dateController = new TextEditingController();

  _setData() => _data =  _dataController.text;
  _setPhone() => _phone =  _phoneController.text;
  _setName() => _name =  _nameController.text;
//  _setDate() => _data =  _dateController.text;

  _setSave() {

    List<Profile> _prof = _data.split('\n').map((item) {
      List<String> _it = item.split(',');
      return Profile(
        date: _date, 
        finance: _name, 
        phone: _phone, 
        plate: _it[0], 
        vehicle: _it[1], 
        note: '',
        number: '',
        ovd: '',
        name: '',
        engine: '',
        frame: '',
        saldo: '',
        address: '');
    }).toList();

    getIt.get<BlkManager>().insertBulks.execute(_prof);

//    print(bulk.toMap());
  }

  Future _getDate() async {
    DateTime _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2024)
    );

    if(_picked != null) setState(() => _date = _picked.toString());
  }

  @override
  void initState() {
    _dataController.addListener(_setData);
    _nameController.addListener(_setName);
    _phoneController.addListener(_setPhone);
//    _dateController.addListener(_setDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    getIt.get<SqlManager>().selectCase.execute(profile);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: MainButton(
                icon: STIcon.arrowLeft,
                onPressed: (context) => Navigator.pop(context)
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 73,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top:5.0, left: 10.0, right: 10.0),
                    child: TextFormField(
                      controller: _nameController,
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.cloudyblue,
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.lightred,
                            width: 2.0
                          )
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:5.0, left: 10.0, right: 10.0),
                    child: TextFormField(
                      controller: _phoneController,
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'No Telp',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.cloudyblue,
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.lightred,
                            width: 2.0
                          )
                        )
                      ),
                    ),
                  ),
/*                  Padding(
                    padding: EdgeInsets.only(top:5.0, left: 10.0, right: 10.0),
                    child: TextFormField(
                      controller: _dateController,
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      decoration: InputDecoration(
                        labelText: 'Tanggal',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.cloudyblue,
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.lightred,
                            width: 2.0
                          )
                        )
                      ),
                    ),
                  ),*/
                  Padding(
                    padding: EdgeInsets.only(top:10.0, bottom: 10.0, left: 10.0, right: 10.0),
                    child: TextButton(
                      text: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('Tanggal ', style: Style.body1.copyWith(color: Style.cloudyblue),)
                      ), 
                      onPressed: (context) => _getDate()
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:5.0, left: 10.0, right: 10.0),
                    child: TextFormField(
                      controller: _dataController,
                      style: Style.body1.copyWith(color: Style.darkindigo),
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Data',
                        labelStyle: Style.body1.copyWith(color: Style.cloudyblue),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.cloudyblue,
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.lightred,
                            width: 2.0
                          )
                        )
                      ),
                    ),
                  ),
                  StreamBuilder<List<dynamic>>(
                    stream: getIt.get<BlkManager>().insertBulks,
                    builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.hasData) {
                        myCallback(() {
                          Navigator.pop(context, true);
                        });
                      }
                      return Padding(
                        padding: EdgeInsets.only(top:10.0, left: 10.0, right: 10.0, bottom: 20.0),
                        child: PrimaryButton(
                          label: 'Simpan', 
                          onPressed: (context) => _setSave()
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  void myCallback(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}