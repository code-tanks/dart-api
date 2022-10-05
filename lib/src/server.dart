import 'dart:convert';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'base_tank.dart';

String commandsToJson(List commands) => jsonEncode(commands);

void run(BaseTank bot) async => await io.serve(
    Router()
      ..get(
        '/ping',
        (_) => ping(),
      )
      ..get(
        '/request_commands',
        (_) => request_commands(bot),
      )
      ..post(
        '/request_commands_by_event',
        (r) => request_commands_by_event(bot, r),
      ),
    '0.0.0.0',
    8080);

Response ping() => Response.ok('pong');

Response request_commands(BaseTank bot) {
  bot.run();

  final json = commandsToJson(bot.commands);

  bot.commands.clear();

  return Response.ok(json, headers: {'Content-type': 'application/json'});
}

Future<Response> request_commands_by_event(
    BaseTank bot, Request request) async {
  final event = jsonDecode(await request.readAsString());

  bot.onEvent(event);

  final json = commandsToJson(bot.commands);

  bot.commands.clear();
  return Response.ok(json, headers: {'Content-type': 'application/json'});
}
