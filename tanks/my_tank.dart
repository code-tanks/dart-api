import 'package:codetanks/codetanks.dart';

class MyTank extends BaseTank {
  MyTank() {
    print("Created my tank!");
  }

  @override
  void run() {
    // TODO: implement run
  }
  
  @override
  void onEvent(EventType e, Map info) {
    // TODO: implement onEvent
  }
}

BaseTank createTank() => MyTank();
