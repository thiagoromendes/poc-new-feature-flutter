import 'package:flutter/material.dart';

class DescriptionDiscoveryPage extends StatefulWidget {
  const DescriptionDiscoveryPage({Key? key}) : super(key: key);

  @override
  _DescriptionDiscoveryPageState createState() =>
      _DescriptionDiscoveryPageState();
}

class _DescriptionDiscoveryPageState extends State<DescriptionDiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Considerações Teóricas'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Flutter Feature Discovery (lib)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    textAlign: TextAlign.start,
                    text: const TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.black45),
                        children: [
                          TextSpan(
                            text: 'Descrever...',
                          ),
                        ])),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Acesse a demonstração'),
              ),
            ],
          ),
        ));
  }
}
