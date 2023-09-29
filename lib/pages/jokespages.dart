import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:tst/services/get10jokes.dart';
import 'dart:math' as math;

class JokePreviewPage extends StatefulWidget {
  const JokePreviewPage({super.key, required this.myjoketype});
  final String? myjoketype;
  @override
  State<JokePreviewPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<JokePreviewPage> {
  List<bool> mySwitchValuesList = [];
  Future<List<dynamic>>? jokesFuture;

  @override
  void initState() {
    super.initState();
    loadJokes();
  }

  void loadJokes() {
    setState(() {
      jokesFuture = fetchJoke(widget.myjoketype);
      mySwitchValuesList = [];
    });

    jokesFuture!.then((jokes) {
      if (mounted) {
        setState(() {
          mySwitchValuesList = List<bool>.filled(jokes.length, false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go Back"),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  loadJokes();
                },
                child: const Text("Reload"),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: jokesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              child: mySwitchValuesList[i]
                                  ? const Text('punchline')
                                  : const Text('setup'),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 150,
                              child: mySwitchValuesList[i]
                                  ? Text('${snapshot.data![i]["punchline"]}')
                                  : Text('${snapshot.data![i]["setup"]}'),
                            ),
                            Expanded(
                              child: Transform.rotate(
                                angle: math.pi / 999,
                                child: FlutterSwitch(
                                  activeColor: Colors.green,
                                  width: 60,
                                  height: 30,
                                  value: mySwitchValuesList[i],
                                  borderRadius: 30.0,
                                  onToggle: (val) {
                                    setState(() {
                                      mySwitchValuesList[i] = val;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
