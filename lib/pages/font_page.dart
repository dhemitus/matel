import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/managers/cfg_manager.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/widgets/buttons/primary_button.dart';

class FontPage extends StatefulWidget {

  FontPage({Key key}) : super(key: key);

  @override
  _FontPageState createState() => _FontPageState();
}

class _FontPageState extends State<FontPage> {
  double _fontsize = Style.fontSize;
  double _keysize = Style.keySize;

  @override
  Widget build(BuildContext context) {
//    getIt.get<SqlManager>().selectCase.execute(profile);

    return Scaffold(
//      resizeToAvoidBottomPadding: false,
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
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text('Ukuran Font', style: Style.subTitle1.copyWith(color: Style.slategrey)),
                  ),
                  Slider(
                    activeColor: Style.oldred,
                    min: 0.5,
                    max: 1.5,
                    onChanged: (val) { 
                      setState(() => _fontsize = val);
                      getIt<CfgManager>().setFontSize.execute(val);
                    },
                    value: _fontsize
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 100.0),
                    child: PrimaryButton(
                      label: 'Reset Ukuran Font', 
                      onPressed: (context) {
                        setState(() => _fontsize = 1.0);
                        getIt<CfgManager>().setFontSize.execute(1.0);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0, top:10.0),
                    child: Text('Ukuran Keyboard Font', style: Style.subTitle1.copyWith(color: Style.slategrey)),
                  ),
                  Slider(
                    activeColor: Style.oldred,
                    min: 0.5,
                    max: 1.5,
                    onChanged: (val) {
                      setState(()=> _keysize = val);
                      getIt<CfgManager>().setKeySize.execute(val);
                    },
                    value: _keysize
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 100.0),
                    child: PrimaryButton(
                      label: 'Reset Ukuran Keyboard Font', 
                      onPressed: (context) {
                        setState(() => _keysize = 1.0);
                        getIt<CfgManager>().setKeySize.execute(1.0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}