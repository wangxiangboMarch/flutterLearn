class Spacecraft {
  String name;
  DateTime? launchDate;

  int _aProperty = 0;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Getters and setters
  int get aProperty => _aProperty;

  set aProperty(int value) {
    if (value >= 0) {
      _aProperty = value;
    }
  }

  // A computed property.
  int get count {
    return [].length;
  }

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void main(List<String> args) {
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
}

/// 扩展类（继承）
///
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}

/// 接口和抽象类
/// Dart 没有 interface 关键字。相反，所有的类都隐式定义了一个接口。因此，任意类都可以作为接口被实现
// class MockSpaceship implements Spacecraft {
//   // ···
// }

/// 你可以创建一个被任意具体类扩展（或实现）的抽象类。抽象类可以包含抽象方法（不含方法体的方法）

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

/// 任意一个扩展了 Describable 的类都拥有 describeWithEmphasis() 方法，
/// 这个方法又会去调用实现类中实现的 describe() 方法。
