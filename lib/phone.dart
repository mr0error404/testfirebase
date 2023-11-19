import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryCode = TextEditingController();
  var phone = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryCode.text = "+972";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ""
                "assets/img1.png",
                width: 250,
                height: 250,
              ),
              // Image.network("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.historichouses.org%2Fhouse%2Ffirle-place%2F&psig=AOvVaw2P4hq-yYU7QVyXmn-_fu1Y&ust=1697876168034000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIDrieGXhIIDFQAAAAAdAAAAABAE"),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phonne before getting started",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryCode,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          phone = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 45.0,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryCode.text + phone}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {},
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    Navigator.pushNamed(context, "otp");
                  },
                  child: Text("Send the code"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
