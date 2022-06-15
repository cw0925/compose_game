import 'package:flame/components.dart';
import 'package:flutter/material.dart';

mixin Blood on PositionComponent{

  final Paint _outlinePaint = Paint();
  final Paint _fillPaint = Paint();
  late double lifePoint; // 生命上限
  late double _currentLife; // 当前生命值

  // 当前血条百分百
  double get _progress => _currentLife / lifePoint;

  late TextComponent _text;
  final double offsetY = 10; // 血条距构件顶部偏移量
  final double widthRadio = 0.8; // 血条/构件宽度
  final double lifeBarHeight = 4; // 血条高度

  void initPaint({
    required double lifePoint,
    Color lifeColor = Colors.red,
    Color outlineColor = Colors.white,
  }) {
    _outlinePaint
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    _fillPaint.color = lifeColor;

    this.lifePoint = lifePoint;
    _currentLife = lifePoint;

    _text = TextComponent(textRenderer: TextPaint(style: const TextStyle(color: Colors.black,fontSize: 10)));
    updateBloodText();
    double y = -(offsetY+_text.height+2);
    double x = (size.x/2)*(1-widthRadio);
    _text.position = Vector2(x, y);
    add(_text);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    const double offsetY = 10; // 血条距构件顶部偏移量
    const double widthRadio = 0.8; // 血条/构件宽度
    const double lifeBarHeight = 4; // 血条高度

    Rect rect = Rect.fromCenter(
        center: Offset(size.x / 2, lifeBarHeight / 2 - offsetY),
        width: size.x * widthRadio,
        height: lifeBarHeight);

    // print('object=== ' + _progress.toString());
    Rect lifeRect = Rect.fromPoints(
        rect.topLeft + Offset(rect.width * (1 - _progress), 0),
        rect.bottomRight);

    canvas.drawRect(lifeRect, _fillPaint);
    canvas.drawRect(rect, _outlinePaint);
  }

  void loss(double point){
    _currentLife -= point;
    if(_currentLife <= 0){
      _currentLife = 0;
      onDied();
    }
    updateBloodText();
  }

  void onDied(){}

  updateBloodText(){
    _text.text = 'HP ${_currentLife.toInt()}';
  }
}