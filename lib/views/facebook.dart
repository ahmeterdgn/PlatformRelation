import 'dart:convert';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Facebook extends StatefulWidget {
  @override
  _FacebookState createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  var profilsee = false;
  var profile;
  _login() async {
    var fbLogin = FacebookLogin();
    var result = await fbLogin.logIn(['email', 'public_profile']);
    final token = result.accessToken.token;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');

    if (result.status == FacebookLoginStatus.loggedIn) {
      setState(() {
        profilsee = !profilsee;
        profile = json.decode(graphResponse.body);
      });
      print(graphResponse.body);
    }
  }

  _logout() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: !profilsee
            ? RaisedButton(
                onPressed: () {
                  _login();
                },
                child: Text('Facebook Login'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(profile['name']),
                  Text(profile['first_name']),
                  Text(profile['last_name']),
                  Text(profile['email']),
                  Text(profile['id']),
                ],
              ),
      ),
    );
  }
}
