import 'package:compose_game/mixins/blood.dart';
import 'package:flame/components.dart';

class HeroComponent extends SpriteAnimationComponent with HasGameRef,Blood{

  /// Pixels/帧
  double speed = 200.0;

  HeroComponent() : super(size: Vector2(50,37), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    ///血条
    initPaint(lifePoint: 100);

    List<Sprite> sprites = [];
    for(int i=0;i<=8;i++){
      sprites.add(await gameRef.loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.15);
    position = gameRef.size / 2;

    // add(RectangleHitbox()..debugMode = true);
  }

  move(Vector2 ds){
    position.add(ds);
  }

}