import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_practise/services/remote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(snapshot.data!['user']['full_name']),
                  Image.network(snapshot.data!['user']['avatar'])
                ],
              );
            },
          ),
          );
        } else return CupertinoActivityIndicator();
      },
    );
  }
}
