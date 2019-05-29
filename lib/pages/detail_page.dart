import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/buttons/text_button.dart';

class DetailPage extends StatefulWidget {

  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 25.0, right: 8.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal:10.0,),
              height: MediaQuery.of(context).size.height - 85,
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Nomor Polisi', style:Style.button.copyWith(color: Style.red)),
                        Text('1002TRM', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Jenis/Merk', style:Style.button.copyWith(color: Style.red)),
                        Text('Honda Freed PSD A/T', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Finance/Leasing', style:Style.button.copyWith(color: Style.red)),
                        Text('MAYBANK NAS 5', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Nama Debitur', style:Style.button.copyWith(color: Style.red)),
                        Text('null', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Nomor Rangka', style:Style.button.copyWith(color: Style.red)),
                        Text('MHGRB09790DJ0980980', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Nomor Mesin', style:Style.button.copyWith(color: Style.red)),
                        Text('L4758996966', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('OVD', style:Style.button.copyWith(color: Style.red)),
                        Text('670', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Saldo', style:Style.button.copyWith(color: Style.red)),
                        Text('3654578', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Catatan Anda', style:Style.button.copyWith(color: Style.red)),
                        Text('Mobil ilang', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    text: Text('Bagikan\nData', textAlign: TextAlign.center, style: Style.button.copyWith(color:Style.oldred),),
                  ),
                  TextButton(
                    text: Text('Buat\nCatatan', textAlign: TextAlign.center, style: Style.button.copyWith(color:Style.oldred),),
                  ),
                  TextButton(
                    text: Text('Laporkan\nData', textAlign: TextAlign.center, style: Style.button.copyWith(color:Style.oldred),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}