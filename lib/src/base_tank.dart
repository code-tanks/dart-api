abstract class BaseTank {
  final commands = <int>[];

  void run();

  void onEvent(Map event);
}

class Command {
  static const NONE = 0;
  static const MOVE_FORWARD = 1 << 0;
  static const MOVE_BACKWARD = 1 << 1;
  static const ROTATE_TANK_CLOCKWISE = 1 << 2;
  static const ROTATE_TANK_COUNTER_CLOCKWISE = 1 << 3;
  static const FIRE = 1 << 4;
}
