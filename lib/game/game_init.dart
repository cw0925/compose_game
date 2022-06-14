import 'package:compose_game/game/compose_game.dart';
import 'package:flame/game.dart';

class GameInit {
  ComposeGame gameRef;
  GameInit(this.gameRef);

  ///初始化
  void init(Vector2 size) {
    const scale = 10.0;
    // final gravity = Vector2(0, -1) * size.gravitySize;
    // gameRef.world.setGravity(gravity);
    // gameRef.viewport = Viewport(size, scale);
    // final boundaries = createBoundaries(gameRef.viewport);
    // boundaries.forEach(gameRef.add);
    //初始化碰撞检测器
    // gameRef.addContactCallback(BallWallContactCallback());
    // gameRef.addContactCallback(BallBallContactCallback());
  }
}