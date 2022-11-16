import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_flutter_exo/bird_animation.dart';
import 'package:rive_flutter_exo/loader_animation.dart';
import 'package:rive_flutter_exo/play_animation.dart';
import 'package:rive_flutter_exo/emojis_animation.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Rive';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
   const PlayPauseAnimation(),
   const BirdAnimation(),
   const LoaderAnimation(),
  const EmojisAnimation()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Flutter Rive Animation'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: 'Play/Pause',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flutter_dash),
            label: 'Flutter Bird',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Chargement',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Emojis',
            backgroundColor: Colors.orange,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey.shade300,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}



class EmojisAnimation extends StatefulWidget {
  const EmojisAnimation({Key? key}) : super(key: key);

  @override
  State<EmojisAnimation> createState() => _EmojisAnimationState();
}

class _EmojisAnimationState extends State<EmojisAnimation> {
  late List emojiList;

  @override
  void initState() {
    super.initState();
    emojiList = [
      {
        'artboard': 'joy',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
      {
        'artboard': 'love',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
      {
        'artboard': 'Tada',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
      {
        'artboard': 'Mindblown',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
      {
        'artboard': 'Onfire',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
      {
        'artboard': 'Bullseye',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemCount: emojiList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                emojiList[index]['hover'].isActive = true;
                setState(() {
                  emojiList[index]['count']++;
                });
              },
              child: Column(children: [
                Container(
                  height: 140,
                  margin: const EdgeInsets.all(10),
                  child: RiveAnimation.asset(
                    'assets/animated-emojis.riv',
                    artboard: emojiList[index]['artboard'],
                    animations: emojiList[index]['animations'],
                    controllers: [emojiList[index]['hover']],
                  ),
                ),
                Text(
                  emojiList[index]['count'].toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ]),
            );
          }),
    );
  }
}