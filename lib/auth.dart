import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';

class Auth {
  isAuth(context) {
    return Future(() {
      if (false) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }
}
