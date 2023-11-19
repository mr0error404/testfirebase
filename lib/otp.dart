import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25,right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(""
                  "assets/img1.png",
                width: 250,
                height: 250,
              ),
              // Image.network("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.historichouses.org%2Fhouse%2Ffirle-place%2F&psig=AOvVaw2P4hq-yYU7QVyXmn-_fu1Y&ust=1697876168034000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIDrieGXhIIDFQAAAAAdAAAAABAE"),
              SizedBox(height: 25,),
              Text("Phone Verification",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Text("We need to register your phonne before getting started",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              // Container(
              //   height: 55,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1 ,color: Colors.grey,),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Row(
              //     children: [
              //       SizedBox(width: 10,),
              //       SizedBox(
              //         width: 40,
              //         child: TextField(
              //           // controller: countryCode,
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Text(
              //         "|",
              //         style: TextStyle(
              //           fontSize: 33,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.grey,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: TextField(
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //             hintText: "Phone",
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,
                // validator: (s) {
                //   return s == '2222' ? null : 'Pin is incorrect';
                // },
                // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(height: 25,),
              SizedBox(
                height: 45.0,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){

                  },
                  child: Text("Verify phone number"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, 'phone', (route) => false);
                },
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Edit Phone number ? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
