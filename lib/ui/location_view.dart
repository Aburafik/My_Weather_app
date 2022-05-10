import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle headerTitleStyle = TextStyle(
        fontSize: 20, color: Color(0xff212D3F), fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Card(
            color: Color(0xffF7F7F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Color(0xffDBDBDB),

                      elevation: 20,
                      // color: Colors.grey,
                      child: SizedBox(
                        height: 120,
                        width: 120,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "UserName",
                            style: headerTitleStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("City"),
                          ),
                          Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Material(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(child: Text("LOGOUT")),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),


        ],
      )),
    );
  }
}
