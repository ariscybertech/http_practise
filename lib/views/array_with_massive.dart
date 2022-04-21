import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_practise/services/remote_service.dart';

class MassiveArray extends StatefulWidget {
  const MassiveArray({Key? key}) : super(key: key);

  @override
  State<MassiveArray> createState() => _MassiveArrayState();
}

class _MassiveArrayState extends State<MassiveArray> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getInfoData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              body: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var channelName =
                  snapshot.data![index]['user']['username'];
              var name = snapshot.data![index]['user']['full_name'];
              var thumbnail = snapshot.data![index]['user']['avatar'];

              return Card(
                elevation: 0,
                child: Column(
                  children: [
                    Image.network(
                      thumbnail,
                      fit: BoxFit.cover,
                      height: 196,
                    ),
                    SizedBox(height: 8),
                    CircleAvatar(
                      radius: 24.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(thumbnail),
                    ),
                    Text(name),
                    Text(channelName),
                  ],
                ),
              );
            },
          ),
          );
        } else
          return CupertinoActivityIndicator();
      },
    );
  }
}
