import 'package:flutter/material.dart';
import 'jokespages.dart';
import 'mydrawer.dart';

class HomePage extends StatefulWidget {
  final bool isDarkModeEnabled = false;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  bool isDarkModeEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('D-Jokes '),
      ),
      drawer: const MyDrawer(), // Replace this line
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.2,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const JokePreviewPage(
                          myjoketype: "random",
                        ),
                      ),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '10 Random Jokes (Mix)',
                      style: TextStyle(),
                    ),
                  )),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.2,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const JokePreviewPage(
                          myjoketype: "general",
                        ),
                      ),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '10 General Jokes',
                      style: TextStyle(),
                    ),
                  )),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.2,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const JokePreviewPage(
                          myjoketype: "programming",
                        ),
                      ),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '10 Programmer Jokes',
                      style: TextStyle(),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
