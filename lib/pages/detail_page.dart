import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/buttons/text_button.dart';
import 'package:flutter_mata_elang/model/profile.dart';

class DetailPage extends StatefulWidget {
  final Profile profile;

  DetailPage({Key key, this.profile}) : super(key: key);

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
                        Text(widget.profile.plate, style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Jenis/Merk', style:Style.button.copyWith(color: Style.red)),
                        Text('${widget.profile.vehicle.length > 20 ? widget.profile.vehicle.substring(0, 20) : widget.profile.vehicle}', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Finance/Leasing', style:Style.button.copyWith(color: Style.red)),
                        Text('${widget.profile.finance},\n${widget.profile.address}', style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Nama Debitur', style:Style.button.copyWith(color: Style.red)),
                        Text(widget.profile.name, style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Nomor Rangka', style:Style.button.copyWith(color: Style.red)),
                        Text(widget.profile.frame, style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Nomor Mesin', style:Style.button.copyWith(color: Style.red)),
                        Text(widget.profile.engine, style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('OVD', style:Style.button.copyWith(color: Style.red)),
                        Text(widget.profile.ovd, style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Saldo', style:Style.button.copyWith(color: Style.red)),
                        Text(widget.profile.saldo, style:Style.body2.copyWith(color: Style.darkindigo)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Catatan Anda', style:Style.button.copyWith(color: Style.red)),
                        Text(widget.profile.note, style:Style.body2.copyWith(color: Style.darkindigo)),
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