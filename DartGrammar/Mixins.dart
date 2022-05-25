/// Mixin 是一种在多个类层次结构中重用代码的方法。下面的是声明一个 Mixin 的做法
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class Spacecraft {}

class PilotedCraft extends Spacecraft with Piloted {
  // ···
}
