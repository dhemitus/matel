import 'package:rx_command/rx_command.dart';
import 'package:rx_command/rx_command_listener.dart';

import 'package:flutter_mata_elang/services/cfg_data.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/style/style.dart';

class CfgManager {
  RxCommand<double, bool> setFontSize;
  RxCommand<void, double> getFontSize;
  RxCommand<double, bool> setKeySize;
  RxCommand<void, double> getKeySize;
  RxCommandListener<double, bool> setFontSizeListener;
  RxCommandListener<double, bool> setKeySizeListener;
  RxCommandListener<void, double> getFontSizeListener;
  RxCommandListener<void, double> getKeySizeListener;

  CfgManager () {
    setFontSize = RxCommand.createAsync<double, bool>(getIt.get<CfgData>().setFontSize);
    getFontSize = RxCommand.createAsyncNoParam<double>(getIt.get<CfgData>().getFontSize);
    setKeySize = RxCommand.createAsync<double, bool>(getIt.get<CfgData>().setKeySize);
    getKeySize = RxCommand.createAsyncNoParam<double>(getIt.get<CfgData>().getKeySize);

    setFontSizeListener = RxCommandListener(
      setFontSize,
      onValue: (data) => getFontSize.execute()
    );

    getFontSizeListener = RxCommandListener(
      getFontSize,
      onValue: (data) => Style.fontSize = data,
    );

    setKeySizeListener = RxCommandListener(
      setKeySize,
      onValue: (data) => getKeySize.execute(),
    );

    getKeySizeListener = RxCommandListener(
      getKeySize,
      onValue: (data) => Style.keySize = data,
    );
  }
}