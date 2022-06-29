import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          alignment: Alignment.center,
          color: Colors.lightBlue,
          child: Text(
            'Profile',style: (TextStyle(color: Colors.red,fontSize: 30)),
          ),
        )
    );
  }
}
