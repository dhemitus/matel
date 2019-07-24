import 'package:rx_command/rx_command.dart';
import 'package:rx_command/rx_command_listener.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_mata_elang/services/get_auth.dart';
import 'package:flutter_mata_elang/services/service_locator.dart';
import 'package:flutter_mata_elang/model/user.dart';

class AuthManager {
  RxCommand<User, http.Response> signin;
  RxCommand<String, bool> signinLog;
  RxCommand<void, List<String>> logSession;
  RxCommand<void, bool> delSession;
  RxCommandListener<User, http.Response> signinListener;
  RxCommandListener<dynamic, bool> logListener;
  RxCommand<bool, bool> switchLoad;
  RxCommand<http.Response, http.Response> signinResult;
  RxCommand<Register, http.Response> signup;
  RxCommandListener<Register, http.Response> signupListener;

  AuthManager() {
    switchLoad = RxCommand.createSync<bool, bool>((b) => b);
    signinResult = RxCommand.createSync<http.Response, http.Response>((b) => b);
    signin = RxCommand.createAsync<User, http.Response>(getIt.get<GetAuth>().signin);
    signinLog = RxCommand.createAsync<String, bool>(getIt.get<GetAuth>().setLog);
    logSession = RxCommand.createAsyncNoParam<List<String>>(getIt.get<GetAuth>().getLog);
    delSession = RxCommand.createAsyncNoParam<bool>(getIt.get<GetAuth>().delLog);

    signinListener = RxCommandListener(
      signin,
      onValue: (val) {
        if(val.statusCode == 200) {
//          print(_anu['token']);
          getIt.get<AuthManager>().signinLog.execute(val.body);
        }
      },
      onIsBusyChange: switchLoad
    );

//    logSession.listen((list) => print(list));

    logListener = RxCommandListener(
      signinLog,
      onValue: (val) => getIt.get<GetAuth>().getLog(),
//      onIsBusyChange: switchLoad
    );

    signup = RxCommand.createAsync<Register, http.Response>(getIt.get<GetAuth>().signup);
    signupListener = RxCommandListener(
      signup,
      onValue: (val) => print(val.toString()),
    );
  }
}