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
              var channelName = snapshot.data![index]['channel_name'];
              var name = snapshot.data![index]['category']['name'];
              var thumbnail = snapshot.data![index]['thumbnail'];
              var logo = snapshot.data![index]['logo'];
              var channelSlug = snapshot.data![index]['channel_slug'];
              var liveWatchers = snapshot.data![index]['live_watchers'].toInt();
              var channelNameUtf8 = channelName.runes.toList();
              var nameUtf8 = name.runes.toList();

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
                      backgroundImage: NetworkImage(logo),
                    ),
                    Text(name)
                  ],
                ),
              );
            },
          ));
        } else
          return CupertinoActivityIndicator();
      },
    );
  }
}
