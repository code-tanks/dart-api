import 'package:codetanks/codetanks.dart';

class DoNothingTank extends BaseTank {
  @override
  void run() {
    commands.add(Command.NONE);
  }

  @override
  void onEvent(Map event) {
    commands.add(Command.NONE);
  }
}

BaseTank createTank() => DoNothingTank();
