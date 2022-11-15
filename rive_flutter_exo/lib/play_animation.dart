// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({Key? key}) : super(key: key);

  @override
  _PlayPauseAnimationState createState() => _PlayPauseAnimationState();
}

class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
  late RiveAnimationController _controller;

  void _togglePlay() {
    setState(() {
      _controller.isActive = !_controller.isActive;
    });
  }

  bool get _isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.network(
          'https://cdn.rive.app/animations/vehicles.riv',
          controllers: [_controller],
          onInit: (_) => setState(() {}),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        backgroundColor: Colors.pink,
        child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
