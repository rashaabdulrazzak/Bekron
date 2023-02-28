
import 'package:flutter/material.dart';
import 'package:flat_chat/components/hero_logo.dart';
import 'package:flat_chat/constants.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:flat_chat/components/map.dart';

class TalkToUs extends StatefulWidget {
  static String id = 'talk_to_us';

  @override
  State<TalkToUs> createState() => _TalkToUsState();
}

class _TalkToUsState extends State<TalkToUs> {
  late String NameSurname;
  late String Mail;
  MapController mapController = MapController();
  LatLng currentCenter = LatLng(41.015137, 28.979530);
  double currentZoom = 13.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    HeroLogo(imgHeight: 70.0),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text(
                          'Work hours',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('MON-SUNDAY 10-22'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainAppColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('Location',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    backgroundColor: mainAppColor),
                                child: const Text('Google maps'),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  backgroundColor: mainAppColor),
                              child: const Text('Yandex maps'),
                            )
                          ],
                        ),
                        map(mapController: mapController, currentCenter: currentCenter, currentZoom: currentZoom)
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Talk to us :)',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFF660935),
                              fontWeight: FontWeight.w600)),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        NameSurname = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'NAME SURNAME'),
                      //keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        Mail = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'MAIL',
                      ),
                      //keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      maxLines: 5,
                      onChanged: (value) {
                        Mail = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Writing part...',
                      ),
                      //keyboardType: TextInputType.emailAddress,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            backgroundColor: mainAppColor),
                        child: const Text('send to us')),
                  ],
                ),
              ),
              Container(
                height: 80,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('CALL'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: mainAppColor),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('WEBSITE'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mainAppColor)),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('MAIL'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: mainAppColor)),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class InputField extends StatelessWidget {
  final String text;
  final int maxlines;
  InputField(this.text, this.maxlines);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintText: text,
        ),
        maxLines: maxlines,
      ),
    );
  }
}