import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class Google extends StatefulWidget {
  @override
  _GoogleState createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  GoogleSignInAccount _currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _currentUser != null
                ? Column(
                    children: [
                      ListTile(
                        leading: GoogleUserCircleAvatar(
                          identity: _currentUser,
                        ),
                        title: Text(_currentUser.displayName ?? ''),
                        subtitle: Text(_currentUser.email ?? ''),
                      ),
                      RaisedButton(
                        onPressed: _logout,
                        child: Text('Logout'),
                      )
                    ],
                  )
                : RaisedButton(
                    onPressed: _singin,
                    child: Text('Google Login'),
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> _singin() async {
    await _googleSignIn.signIn();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }
}

Future<void> _logout() async {
  await _googleSignIn.disconnect();
}
