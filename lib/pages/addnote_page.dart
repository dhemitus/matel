import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/style/style.dart';
import 'package:flutter_mata_elang/style/icon.dart';
import 'package:flutter_mata_elang/widgets/buttons/main_button.dart';
import 'package:flutter_mata_elang/widgets/buttons/primary_button.dart';
import 'package:flutter_mata_elang/model/profile.dart';
import 'package:flutter_mata_elang/managers/sql_manager.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';

class AddnotePage extends StatefulWidget {
  final Profile profile;

  AddnotePage({Key key, this.profile}) : super(key: key);

  @override
  _AddnotePageState createState() => _AddnotePageState();
}

class _AddnotePageState extends State<AddnotePage> {

  TextEditingController _noteController = new TextEditingController();

  _setNote() => widget.profile.note =  _noteController.text;

  _saveNote() => getIt.get<SqlManager>().insertNote.execute(widget.profile);

  @override
  void initState() {
    _noteController.addListener(_setNote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _noteController.text = widget.profile.note;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 25.0, right: 8.0),
            width: MediaQuery.of(context).size.width - 58.0,
            height: 48.0,
            child: MainButton(
              icon: STIcon.arrowLeft,
                onPressed: (context) => Navigator.pop(context)
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom:14.0),
                  child: TextFormField(
                    controller: _noteController,
                    style: Style.body1.copyWith(color: Style.darkindigo),
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Catatan',
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
                StreamBuilder<int>(
                  stream: getIt.get<SqlManager>().insertNote,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if(snapshot.hasData && snapshot.data == 1) {
                      Navigator.pop(context);
                    }
                    return PrimaryButton(
                      label: 'Simpan', 
                      onPressed: (context) => _saveNote()
                    );
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
