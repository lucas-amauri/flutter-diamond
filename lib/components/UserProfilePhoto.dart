import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserProfilePhoto {
  static create({
    double radius : 50,
    String? url,
  }) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: url == null ? null : new CachedNetworkImageProvider(url) ,
      backgroundColor: Colors.grey[400],
      child : url == null ? new Icon(Icons.person, size : radius, color : Colors.grey) : null
    );
  }
}