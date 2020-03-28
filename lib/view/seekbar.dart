import 'package:flutter/material.dart';

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return  SliderTheme( //自定义风格
      data: SliderTheme.of(context).copyWith(
//          activeTrackColor: Colors.pink, //进度条滑块左边颜色
//          inactiveTrackColor: Colors.blue, //进度条滑块右边颜色
//          trackShape: RoundSliderTrackShape(radius: 10),//进度条形状,这边自定义两头显示圆角
//          thumbColor: Colors.yellow, //滑块颜色
          overlayColor: Colors.white12, //滑块拖拽时外圈的颜色
//          overlayShape: RoundSliderOverlayShape(//可继承SliderComponentShape自定义形状
//            overlayRadius: 25, //滑块外圈大小
//          ),
          thumbShape: RoundSliderThumbShape(//可继承SliderComponentShape自定义形状
//            disabledThumbRadius: 15, //禁用是滑块大小
            enabledThumbRadius: 5, //滑块大小
          ),
//          inactiveTickMarkColor: Colors.black,
//          tickMarkShape: RoundSliderTickMarkShape(//继承SliderTickMarkShape可自定义刻度形状
//            tickMarkRadius: 4.0,//刻度大小
//          ),
//          showValueIndicator: ShowValueIndicator.onlyForDiscrete,//气泡显示的形式
//          valueIndicatorColor: Colors.red,//气泡颜色
//          valueIndicatorShape: PaddleSliderValueIndicatorShape(),//气泡形状
//          valueIndicatorTextStyle: TextStyle(color: Colors.black),//气泡里值的风格
//          trackHeight: 10 //进度条宽度

      ),
      child: Slider(
        min: 0.0,
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        max: widget.duration.inMilliseconds.toDouble(),
        value: _dragValue ?? widget.position.inMilliseconds.toDouble(),
        onChanged: (value) {
          setState(() {
            _dragValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged(Duration(milliseconds: value.round()));
          }
        },
        onChangeEnd: (value) {
          _dragValue = null;
          if (widget.onChangeEnd != null) {
            widget.onChangeEnd(Duration(milliseconds: value.round()));
          }
        },
      ),
    );
  }
}

class PlaySeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  PlaySeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _PlaySeekBarState createState() => _PlaySeekBarState();
}

class _PlaySeekBarState extends State<PlaySeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return  SliderTheme( //自定义风格
      data: SliderTheme.of(context).copyWith(
//          activeTrackColor: Colors.pink, //进度条滑块左边颜色
//          inactiveTrackColor: Colors.blue, //进度条滑块右边颜色
//          trackShape: RoundSliderTrackShape(radius: 10),//进度条形状,这边自定义两头显示圆角
//          thumbColor: Colors.yellow, //滑块颜色
        overlayColor: Colors.white12, //滑块拖拽时外圈的颜色
//          overlayShape: RoundSliderOverlayShape(//可继承SliderComponentShape自定义形状
//            overlayRadius: 25, //滑块外圈大小
//          ),
        thumbShape: RoundSliderThumbShape(//可继承SliderComponentShape自定义形状
//            disabledThumbRadius: 15, //禁用是滑块大小
          enabledThumbRadius: 5, //滑块大小
        ),
//          inactiveTickMarkColor: Colors.black,
//          tickMarkShape: RoundSliderTickMarkShape(//继承SliderTickMarkShape可自定义刻度形状
//            tickMarkRadius: 4.0,//刻度大小
//          ),
//          showValueIndicator: ShowValueIndicator.onlyForDiscrete,//气泡显示的形式
//          valueIndicatorColor: Colors.red,//气泡颜色
//          valueIndicatorShape: PaddleSliderValueIndicatorShape(),//气泡形状
//          valueIndicatorTextStyle: TextStyle(color: Colors.black),//气泡里值的风格
//          trackHeight: 10 //进度条宽度

      ),
      child: Slider(
        min: 0.0,
        activeColor: Color(0xFF4D6B9C),
        inactiveColor:  Color(0xFFADB9CD),
        max: widget.duration.inMilliseconds.toDouble(),
        value: _dragValue ?? widget.position.inMilliseconds.toDouble(),
        onChanged: (value) {
          setState(() {
            _dragValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged(Duration(milliseconds: value.round()));
          }
        },
        onChangeEnd: (value) {
          _dragValue = null;
          if (widget.onChangeEnd != null) {
            widget.onChangeEnd(Duration(milliseconds: value.round()));
          }
        },
      ),
    );
  }
}

