import 'package:shelf/shelf.dart';
import 'package:shelf_test_handler/shelf_test_handler.dart';

import 'package:codetanks/codetanks.dart';
import 'package:test/test.dart';

import 'do_nothing_tank.dart';

void main() {
  late ShelfTestServer server;
  late BaseTank bot;

  setUp(() async {
    server = await ShelfTestServer.create();
    bot = DoNothingTank();
  });

  test('ping', () async {
    server.handler.expect('GET', '/ping', expectAsync1((_) => ping()));
    final response = await server.handler(_get('/ping'));
    final string = await response.readAsString();
    expect(response.statusCode, equals(200));
    expect(string, equals('pong'));
    expect(response.statusCode, isNot(400));
    expect(string, isNot('error'));
  });

  test('request_commands', () async {
    server.handler.expect(
        'GET', '/request_commands', expectAsync1((_) => request_commands(bot)));
    final response = await server.handler(_get('/request_commands'));
    final string = await response.readAsString();
    expect(response.statusCode, equals(200));
    expect(response.statusCode, isNot(400));
    expect(string, equals('[0]'));
    expect(string, isNot('[]'));
  });

  test('request_commands_by_event', () async {
    server.handler.expect('POST', '/request_commands_by_event',
        expectAsync1((r) => request_commands_by_event(bot, r)));
    final response = await server.handler(
        _post('/request_commands_by_event', '{"event_type":0,"info":{}}'));
    final string = await response.readAsString();
    expect(response.statusCode, equals(200));
    expect(response.statusCode, isNot(400));
    expect(
      string,
      equals('[0]'),
    );
    expect(string, isNot('[]'));
  });

  tearDown(() {
    addTearDown(server.close);
  });
}

Request _post(String path, Object? body) =>
    Request('POST', Uri.parse('http://localhost:80$path'), body: body);

Request _get(String path) =>
    Request('GET', Uri.parse('http://localhost:80$path'));
