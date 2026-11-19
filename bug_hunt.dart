class Phone {
  String _brand = ''; // bug 1
  int _battery = 0; // bug 2

  Phone(String brand, int battery) {
    _brand = brand; // bug 1 fixed
    _battery = battery; // bug 2 fixed
  }
  int get battery {
    return _battery;
  }
  set battery(int newBattery) { // bug 5 fixed
    if (newBattery < 0 || newBattery > 100) {
      print('Error: battery must be between 0 and 100');
    } else {
      _battery = newBattery;
    }
  }
}

class SmartPhone extends Phone {
  String _system = '';

  SmartPhone(String brand, int battery, String system): super(brand, battery) { // bug 3 fixed by adding super
    _system = system;
  }

  void restart() { //bug 4 fixed (removed @override)
    print('Restarting $_system');
  }
}

void main() {
  Phone p = new Phone('Tecno', 50);
  p.battery = 100; // bug 5 fixed by setting setter
  print(p.battery); // not a bug and fixed by removing () 
}
