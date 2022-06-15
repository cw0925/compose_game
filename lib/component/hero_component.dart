import 'package:compose_game/component/bullet.dart';
import 'package:compose_game/mixins/blood.dart';
import 'package:flame/components.dart';

class HeroComponent extends SpriteAnimationComponent with HasGameRef,Blood{

  /// Pixels/帧
  double speed = 200.0;

  HeroComponent() : super(size: Vector2(50,37), anchor: Anchor.center);

  late Sprite bulletSprite;

  @override
  Future<void> onLoad() async {
    ///血条
    initPaint(lifePoint: 100);

    List<Sprite> sprites = [];
    for(int i=0;i<=8;i++){
      sprites.add(await gameRef.loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    playing = false;
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.15,loop: false);
    position = gameRef.size / 2;
    animation!.onComplete = _onLastFrame;
    // add(RectangleHitbox()..debugMode = true);

    bulletSprite = await gameRef.loadSprite('adventurer/weapon_arrow.png');
  }

  move(Vector2 ds){
    position.add(ds);
  }


  void _onLastFrame(){
    animation!.currentIndex = 0;
    animation!.update(0);
  }

  void shoot(){
    playing = true;
    animation!.reset();
    
    Bullet bullet = Bullet(sprite: bulletSprite, maxRange: 500);
    bullet.size = Vector2(32, 32);
    bullet.anchor = Anchor.center;
    bullet.priority = 1;
    priority = 2;
    bullet.position = position - Vector2(0, -3);
    gameRef.add(bullet);
  }

}