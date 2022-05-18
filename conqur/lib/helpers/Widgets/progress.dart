import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicProgressCustom extends StatefulWidget {
  final double? _percent;
  final double height;
  final Duration duration;
  final ProgressStyle style;
  final Curve curve;

  const NeumorphicProgressCustom(
      {Key? key,
      double? percent,
      this.height = 10,
      this.duration = const Duration(milliseconds: 300),
      this.style = const ProgressStyle(),
      this.curve = Curves.easeOutCubic})
      : this._percent = percent,
        super(key: key);

  @override
  _NeumorphicProgressCustomState createState() =>
      _NeumorphicProgressCustomState();

  double get percent => _percent!.clamp(0, 1);

  @override
  // ignore: invalid_override_of_non_virtual_member
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphicProgress &&
          runtimeType == other.runtimeType &&
          percent == other.percent &&
          height == other.height &&
          style == other.style &&
          curve == other.curve;

  @override
  // ignore: invalid_override_of_non_virtual_member
  int get hashCode =>
      percent.hashCode ^ height.hashCode ^ style.hashCode ^ curve.hashCode;
}

class _NeumorphicProgressCustomState extends State<NeumorphicProgressCustom>
    with TickerProviderStateMixin {
  double oldPercent = 0;

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: widget.percent, end: oldPercent)
        .animate(_controller);
  }

  @override
  void didUpdateWidget(NeumorphicProgressCustom oldWidget) {
    if (oldWidget.percent != widget.percent) {
      _controller.reset();
      oldPercent = oldWidget.percent;
      _animation = Tween<double>(begin: oldPercent, end: widget.percent)
          .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print("widget.style.depth: ${widget.style.depth}");

    final NeumorphicThemeData theme = NeumorphicTheme.currentTheme(context);
    return SizedBox(
      height: widget.height,
      child: FractionallySizedBox(
        widthFactor: 1,
        //width: constraints.maxWidth,
        child: Neumorphic(
          padding: EdgeInsets.zero,
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(widget.style.borderRadius),
            disableDepth: widget.style.disableDepth,
            border: widget.style.border,
            depth: widget.style.depth,
            shadowDarkColorEmboss: Colors.blue,
            shadowLightColorEmboss: Colors.red,
            intensity: 1,
            shape: NeumorphicShape.flat,
          ),
          child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _animation.value,
                  child: _GradientProgress(
                    borderRadius: widget.style.gradientBorderRadius ??
                        widget.style.borderRadius,
                    begin: widget.style.progressGradientStart ??
                        Alignment.centerLeft,
                    end: widget.style.progressGradientEnd ??
                        Alignment.centerRight,
                    colors: [
                      widget.style.variant ?? theme.variantColor,
                      widget.style.accent ?? theme.accentColor,
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class _GradientProgress extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color> colors;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: this.borderRadius,
        gradient: LinearGradient(
            begin: this.begin, end: this.end, colors: this.colors),
      ),
    );
  }

  const _GradientProgress({
    required this.begin,
    required this.end,
    required this.colors,
    required this.borderRadius,
  });
}
