import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/menus/menu_drawer.dart';
import 'package:flutter_mata_elang/widgets/buttons/secondary_button.dart';

class BillingPage extends StatefulWidget {

  BillingPage({Key key}) : super(key: key);

  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: MenuDrawer()
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 48.0,
              child: MainButton(
                icon: STIcon.menu,
                onPressed: (context) => scaffoldKey.currentState.openDrawer()
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal:20.0,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Jika anda ingin melakukan aktivasi akun ataupun perpanjangan silakan lakukan pembayaran dengan cara:\n\nSilakan transfer melalui ATM atau SMS Banking atau Internet Banking ke:\n\nNOMOR REKENING:\n\n No. Rek: 8735151351\n\nAtas nama: Julian Andika Nanang Suwandaru\n\nBANK BCA\n\nDengan jumlah RP. 100.000 (PROMO) per bulan\n\nDan konfirmasi ke CS Data Mateldengan cara:\n\nKirim foto struk pengiriman atau bukti transfer melalui whatsapp atau klik tombol bawah ini:', 
                    style:Style.body2.copyWith(color: Style.slategrey)),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: SecondaryButton(
                      icon: STIcon.whatsApp,
                      label: '082191443443', 
                      onPressed: (context) => print('bill')
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
