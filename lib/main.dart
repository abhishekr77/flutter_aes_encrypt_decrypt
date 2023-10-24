import 'package:flutter/material.dart';

import 'decrypt.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _encryptData = "";
  String _decryptData = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Explore Encrypt & Decrypt"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _textEditingController),
            TextButton(
                onPressed: () async {
                 _encryptData= await MyEncryptionDecryption()
                      .encryptt(data: _textEditingController.text);
                  setState(() {

                  });
                },
                child: const Text("Encrypt")),
            Text("Encrypted Text: $_encryptData"),
            TextButton(
                onPressed: _encryptData == "" ? null : () async {
                  _decryptData= await  MyEncryptionDecryption()
                      .decryptt(data:_encryptData);
                  setState(() {

                  });
                },
                child: const Text("Decrypt")),
            Text("Decrypt Text: $_decryptData"),
          ],
        ),
      ),
    );
  }
}
