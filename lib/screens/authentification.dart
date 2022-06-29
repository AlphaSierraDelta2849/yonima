import 'package:flutter/material.dart';
import 'package:yonima/model/User.dart';

class Authentification extends StatefulWidget {
  const Authentification({Key? key}) : super(key: key);

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  bool otpVisibility = false;
  User? user;
  String verificationID = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Connexion",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Color.fromRGBO(56, 182, 255, 1),
      ),
      body: Center(
        //margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
                hintText: 'Numéro téléphone',
                prefix: Padding(
                  padding: EdgeInsets.all(2),
                  child: Text('+221'),
                ),
              ),
              maxLength: 10,
              keyboardType: TextInputType.phone,
            ),
            Visibility(
              child: TextField(
                controller: otpController,
                decoration: InputDecoration(
                  hintText: 'OTP',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(''),
                  ),
                ),
                maxLength: 6,
                keyboardType: TextInputType.number,
              ),
              visible: otpVisibility,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Divider(),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(56, 182, 255, 1),
              onPressed: () {
                if (otpVisibility) {
                    //verifyOTP();
                } else {
                    //loginWithPhone();
                }
              },
              child: Text(
                otpVisibility ? "Vérifier" : "Se connecter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
