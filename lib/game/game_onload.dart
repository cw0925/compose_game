import 'package:compose_game/component/hero_component.dart';
import 'package:compose_game/game/compose_game.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class GameOnLoad {
  ComposeGame gameRef;
  GameOnLoad(this.gameRef);

  Future<void> onLoad() async{
    ///背景
    final background = SpriteComponent(sprite: await Sprite.load('bg.png'));
    await gameRef.add(background);
    ///射手
    final player = HeroComponent();
    gameRef.add(player);
    ///操纵杆
    final knobPaint = BasicPalette.blue.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.blue.withAlpha(100).paint();
    JoystickComponent joystick = JoystickComponent(
      knob: CircleComponent(radius: 25, paint: knobPaint),
      background: CircleComponent(radius: 60, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    gameRef.add(joystick);

  }

}