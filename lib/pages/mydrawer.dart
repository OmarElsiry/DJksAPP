import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tst/services/mydarklightmode.dart';
import 'package:url_launcher/link.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  MyDrawerState createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
  late Future<LottieBuilder> _lottieFuture;

  @override
  void initState() {
    super.initState();
    _lottieFuture = lottieCall();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(
            title: Text(
              'Night/Light Mode',
              style: TextStyle(letterSpacing: 2, fontSize: 14),
            ),
            trailing: MyDarkLightModeButton(),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Leading(lottieFuture: _lottieFuture),
            title: const Text('My First UseLess App'),
            subtitle: const Text('Made by Potter_Parker'),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Container(
                width: (MediaQuery.of(context).size.width * 0.64),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 15, 247, 119),
                  borderRadius:
                      BorderRadius.circular(10), // adjust the value as needed
                ),
                child: Link(
                  uri: Uri.parse('http://t.me/Potter_Parker'),
                  builder: (context, followLink) {
                    return TextButton(
                      onPressed: followLink,
                      child: const Text('Contact Me',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              color: Color.fromARGB(255, 255, 255, 255))),
                    );
                  },
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Leading extends StatelessWidget {
  const Leading({
    super.key,
    required Future<LottieBuilder> lottieFuture,
  }) : _lottieFuture = lottieFuture;

  final Future<LottieBuilder> _lottieFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _lottieFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Show error message
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Lottie.asset('Assets/myGif.json'),
          );
        }
      },
    );
  }
}

Future<LottieBuilder> lottieCall() async {
  await Future.delayed(const Duration(seconds: 1)); // Add a delay.
  return Lottie.asset('Assets/myGif.json');
}
