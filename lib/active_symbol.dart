import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';

void main(List<String> arguments) {
  final channel = IOWebSocketChannel.connect(
      'wss://ws.binaryws.com/websockets/v3?app_id=1089');

  channel.stream.listen((activeSym) {
    final decodedMessage = jsonDecode(activeSym);
    final activeSymbol = decodedMessage["active_symbols"];

    for (int i = 0; i < 10; i++) {
      print(activeSymbol[i]["symbol"]);
    }
  });

  channel.sink.add('{"active_symbols": "brief"}');
}

  // channel.sink.add('{"time": 1}');

  // channel.stream.listen((activeSym) {
  //   final decodedMessage = jsonDecode(activeSym);
  //   final activeSymbol = decodedMessage["active_symbols"];

  //   for (int i = 0; i < 10; i++) {
  //     print(activeSymbol[i]["symbol"]);
  //   }
  // });

  // channel.sink.add('{"active_symbols": "brief"}');