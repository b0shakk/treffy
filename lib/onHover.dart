import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:sprung/sprung.dart';

class onHover extends StatefulWidget {

  final Widget child;
  const onHover({super.key, required this.child});

  @override
  State<onHover> createState() => _onHoverState();
}

class _onHoverState extends State<onHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(-18,-10,10)..scale(1.1);
    final transform = isHovered? hoveredTransform: Matrix4.identity();

    return MouseRegion(
      // cursor: SystemMouseCursors.zoomIn,
      onEnter: (event) => onEntered(true),
      onExit:(event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        // curve: Sprung.overDamped,
        transform: transform,
        child: widget.child),
      );
  }

  void onEntered(bool isHovered) => setState(() {
    this.isHovered = isHovered;
  });
}