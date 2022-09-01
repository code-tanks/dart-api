// abstract class BaseTank {
//   final currentCommands = <Map>[];

//   void run();

//   void onScanTank(ScanTankEvent e) {}

//   void onCollisionEvent(CollisionEvent e) {}

//   void aheadBy(int amount) {
//     _createAndAddCommandWithArgument('ahead_by', amount);
//   }

//   void setAheadBy(int amount) {
//     _createAndAddCommandWithArgument('set_ahead_by', amount);
//   }

//   void backBy(int amount) {
//     _createAndAddCommandWithArgument('back_by', amount);
//   }

//   void setBackBy(int amount) {
//     _createAndAddCommandWithArgument('set_back_by', amount);
//   }

//   void requestInfo(String infoType) {
//     _createAndAddCommandWithArgument('request_info', infoType);
//   }

//   void rotateTankBy(int amount) {
//     _createAndAddCommandWithArgument('rotate_tank_by', amount);
//   }

//   void setRotateTankBy(int amount) {
//     _createAndAddCommandWithArgument('set_rotate_tank_by', amount);
//   }

//   void rotateGunBy(int amount) {
//     _createAndAddCommandWithArgument('rotate_gun_by', amount);
//   }

//   void setRotateGunBy(int amount) {
//     _createAndAddCommandWithArgument('set_rotate_gun_by', amount);
//   }

//   void rotateRadarBy(int amount) {
//     _createAndAddCommandWithArgument('rotate_radar_by', amount);
//   }

//   void setRotateRadarBy(int amount) {
//     _createAndAddCommandWithArgument('set_rotate_radar_by', amount);
//   }

//   void setRadarToRotateWithGun(bool b) {
//     _createAndAddCommandWithArgument('set_radar_to_rotate_with_gun', b);
//   }

//   void setGunToRotateWithTank(bool b) {
//     _createAndAddCommandWithArgument('set_gun_to_rotate_with_tank', b);
//   }

//   void fireWithPower(int power) {
//     _createAndAddCommandWithArgument('fire_with_power', power);
//   }

//   void setFireWithPower(int power) {
//     _createAndAddCommandWithArgument('set_fire_with_power', power);
//   }

//   void pause(int count) {
//     _createAndAddCommandWithArgument('pause', count);
//   }

//   void _createAndAddCommandWithArgument(
//       String commandType, dynamic commandArg) {
//     currentCommands
//         .add({'command_type': commandType, 'command_arg': commandArg});
//   }
// }

enum EventType { scan, collision }

// class GameEvent {
//   final String eventName;

//   final Map info;

//   GameEvent(this.eventName, this.info);

//   Map toJson() => {'event_name': eventName, 'info': info};
// }

// class ScanTankEvent extends GameEvent {
//   ScanTankEvent(Map info) : super('scan_tank_event', info);
// }

// class CollisionEvent extends GameEvent {
//   CollisionEvent(Map info) : super('collision_event', info);
// }

abstract class BaseTank {
  final commands = <int>[];

  void run();

  void onEvent(EventType e, Map info);
}

class Command {
  static const NONE = 0;
  static const MOVE_FORWARD = 1 << 0;
  static const MOVE_BACKWARD = 1 << 1;
  static const ROTATE_TANK_CLOCKWISE = 1 << 2;
  static const ROTATE_TANK_COUNTER_CLOCKWISE = 1 << 3;
  static const FIRE = 1 << 4;
}

// enum CommandType {
//   None,
//   MoveForward,
//   MoveBackward,
//   RotateTankClockwise,
//   RotateTankCounterClockwise,
//   RotateGunClockwise,
//   RotateGunCounterClockwise,
//   RotateRaderClockwise,
//   RotateRaderCounterClockwise,
//   FireWithPower,
// }
