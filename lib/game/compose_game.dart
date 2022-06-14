import 'dart:math';

import 'package:compose_game/component/hero_component.dart';
import 'package:compose_game/component/monster_component.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class ComposeGame extends FlameGame with TapDetector {

  late final HeroComponent player;
  // late final JoystickComponent joystick;
  final Random _random = Random();
  late final MonsterComponent monster;

  @override
  Future<void>? onLoad() async{
    ///背景
    final background = SpriteComponent(sprite: await Sprite.load('bg.png'));
    await add(background);
    ///射手
    player = HeroComponent();
    add(player);
    ///操纵杆
    // final knobPaint = BasicPalette.blue.withAlpha(200).paint();
    // final backgroundPaint = BasicPalette.blue.withAlpha(100).paint();
    // joystick = JoystickComponent(
    //   knob: CircleComponent(radius: 25, paint: knobPaint),
    //   background: CircleComponent(radius: 60, paint: backgroundPaint),
    //   margin: const EdgeInsets.only(left: 40, bottom: 40),
    // );
    // add(joystick);
    ///怪物
    /// 加载 SpriteSheet
    const String src = 'adventurer/animatronic.png';
    await images.load(src);
    var image = images.fromCache(src);
    SpriteSheet sheet = SpriteSheet.fromColumnsAndRows(image: image, columns: 13, rows: 6);
    int frameCount = sheet.rows * sheet.columns;
    List<Sprite> sprites = List.generate(frameCount, (index) => sheet.getSpriteById(index));
    SpriteAnimation animation = SpriteAnimation.spriteList(sprites, stepTime: 1/24,loop: true);
    Vector2 monsterSize = Vector2(64,64);
    final double pY = _random.nextDouble()*size.y;
    final double pX = size.x - monsterSize.x/2;
    monster = MonsterComponent(animation: animation,size: monsterSize,position: Vector2(pX, pY));
    add(monster);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // if(!joystick.delta.isZero()){
    //   Vector2 ds = joystick.relativeDelta * player.speed * dt;
    //   player.move(ds);
    // }
  }

  @override
  void onTap() {
    monster.loss(10);
  }

}