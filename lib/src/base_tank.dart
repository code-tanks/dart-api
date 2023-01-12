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
  static const ROTATE_GUN_CLOCKWISE = 1 << 5;
  static const ROTATE_GUN_COUNTER_CLOCKWISE = 1 << 6;
  static const ROTATE_RADAR_CLOCKWISE = 1 << 7;
  static const ROTATE_RADAR_COUNTER_CLOCKWISE = 1 << 8;
  static const LOCK_GUN = 1 << 9;
  static const UNLOCK_GUN = 1 << 10;
  static const LOCK_RADAR = 1 << 11;
  static const UNLOCK_RADAR = 1 << 12;
}
