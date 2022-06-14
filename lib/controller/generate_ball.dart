import 'package:compose_game/game/compose_game.dart';
import 'package:flame/components.dart';

import '../component/ball.dart';

class GenerateBall {

  ComposeGame gameRef;
  GenerateBall(this.gameRef);

  generateBall(Vector2 position){
    final ball = Ball(position);
    gameRef.add(ball);
  }
}