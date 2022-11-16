import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoaderAnimation extends StatefulWidget {
  const LoaderAnimation({Key? key}) : super(key: key);

  @override
  _LoaderAnimationState createState() => _LoaderAnimationState();
}

class _LoaderAnimationState extends State<LoaderAnimation> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 300,
          child: _isLoading
              ? RiveAnimation.asset('assets/loader.riv')
              : Center(
                  child: Text("Rien à afficher"),
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: ElevatedButton(onPressed: () {
            setState(() {
              _isLoading = !_isLoading;
            });
          }, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _isLoading 
              ? [
                const Icon(Icons.pause),
                const SizedBox(width: 10),
                const Text("Arretez le chargement")
              ]
              : [
                const Icon(Icons.play_arrow),
                const SizedBox(width: 10),
                const Text("Lancez le chargement")
              ]
            ),
          ),
        ),
      ]),
    );
  }
}
