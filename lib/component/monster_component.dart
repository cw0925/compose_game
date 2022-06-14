import 'package:compose_game/mixins/blood.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MonsterComponent extends SpriteAnimationComponent with Blood{

  final Paint _outlinePaint = Paint();
  final Paint _fillPaint = Paint();

  MonsterComponent({
    required SpriteAnimation animation,
    required Vector2 size,
    required Vector2 position
  }) : super(animation: animation, size: size, position: position, anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    // add(RectangleHitbox()..debugMode = true);
    initPaint(lifePoint: 100);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    Color lifeColor = Colors.red; // 血条颜色
    Color outlineColor = Colors.white; // 外框颜色
    const double offsetY = 10; // 血条距构件顶部偏移量
    const double widthRadio = 0.8; // 血条/构件宽度
    const double lifeBarHeight = 4; // 血条高度
    const double lifeProgress = 0.8; // 当前血条百分百

    Rect rect = Rect.fromCenter(
        center: Offset(size.x / 2, lifeBarHeight / 2 - offsetY),
        width: size.x * widthRadio,
        height: lifeBarHeight);
    Rect lifeRect = Rect.fromPoints(
        rect.topLeft + Offset(rect.width * (1 - lifeProgress), 0),
        rect.bottomRight);

    _outlinePaint
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    _fillPaint.color = lifeColor;
    canvas.drawRect(lifeRect, _fillPaint);
    canvas.drawRect(rect, _outlinePaint);
  }

  @override
  void onDied(){
    removeFromParent();
  }


}