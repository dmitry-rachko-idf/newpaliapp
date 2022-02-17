import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Is the string is palindrome'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _palindrome;
  bool _result = true;
  @override
  void initState() {
    super.initState();
    _palindrome = TextEditingController();

  }

  @override
  void dispose() {
    super.dispose();
    _palindrome.dispose();

  }

  bool _isPanlindrome(String word) {
    for (int i = 0; i < word.length ~/ 2; i++) {
      if (word[i] != word[word.length - i - 1]) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 250,
              padding:
              const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(20),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: TextField(
                controller: _palindrome,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.black.withAlpha(120),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                'check out',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  _result = _isPanlindrome(_palindrome.text.trim().toLowerCase());
                },);
              },
            ),
            const SizedBox(height: 15,),
            Text(_result ? 'The String is palindrome' : 'The string is not palindrome',),
          ],
        ),
      ),
    );
  }
}
