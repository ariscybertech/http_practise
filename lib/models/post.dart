// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    Post({
        required this.user,
        required this.channelName,
        required this.channelDescription,
        required this.channelSlug,
        required this.category,
        required this.liveAt,
        required this.logo,
        required this.thumbnail,
        required this.liveWatchers,
    });

    User user;
    String channelName;
    String channelDescription;
    String channelSlug;
    int category;
    DateTime liveAt;
    String logo;
    String thumbnail;
    int liveWatchers;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        user: User.fromJson(json["user"]),
        channelName: json["channel_name"],
        channelDescription: json["channel_description"],
        channelSlug: json["channel_slug"],
        category: json["category"],
        liveAt: DateTime.parse(json["live_at"]),
        logo: json["logo"],
        thumbnail: json["thumbnail"],
        liveWatchers: json["live_watchers"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "channel_name": channelName,
        "channel_description": channelDescription,
        "channel_slug": channelSlug,
        "category": category,
        "live_at": liveAt.toIso8601String(),
        "logo": logo,
        "thumbnail": thumbnail,
        "live_watchers": liveWatchers,
    };
}

class User {
    User({
        required this.username,
        required this.fullName,
        required this.avatar,
        required this.isOfficial,
    });

    String username;
    String fullName;
    String avatar;
    bool isOfficial;

    factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        fullName: json["full_name"],
        avatar: json["avatar"],
        isOfficial: json["is_official"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "full_name": fullName,
        "avatar": avatar,
        "is_official": isOfficial,
    };
}
