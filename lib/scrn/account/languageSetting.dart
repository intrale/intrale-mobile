import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class languageSetting extends StatefulWidget {
  languageSetting({Key key}) : super(key: key);

  _languageSettingState createState() => _languageSettingState();
}

class _languageSettingState extends State<languageSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'languageSetting',
          style: TextStyle(
              fontFamily: "Gotik",
              fontWeight: FontWeight.w600,
              fontSize: 18.5,
              letterSpacing: 1.2,
              color: Colors.black87),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => NetworkGiffyDialog(
                            image: Image.asset(
                              "assets/gif/earth.gif",
                              fit: BoxFit.cover,
                            ),
                            title: Text('titleCard',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600)),
                            description: Text(
                              'descCard',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black26),
                            ),
                            onOkButtonPressed: () {
                              Navigator.pop(context);
                            },
                          ));
                },
                child: cardName(
                  flag: "assets/img/us.png",
                  title: 'english',
                )),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => NetworkGiffyDialog(
                            image: Image.asset(
                              "assets/gif/earth.gif",
                              fit: BoxFit.cover,
                            ),
                            title: Text('titleCard',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600)),
                            description: Text(
                              'descCard',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black26),
                            ),
                            onOkButtonPressed: () {
                              Navigator.pop(context);
                            },
                          ));
                },
                child: cardName(
                  flag: "assets/img/arab.png",
                  title: 'arabic',
                )),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => NetworkGiffyDialog(
                            image: Image.asset(
                              "assets/gif/earth.gif",
                              fit: BoxFit.cover,
                            ),
                            title: Text('titleCard',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600)),
                            description: Text(
                              'descCard',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black26),
                            ),
                            onOkButtonPressed: () {
                              Navigator.pop(context);
                            },
                          ));
                },
                child: cardName(
                  flag: "assets/img/china.png",
                  title: 'chinese',
                )),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => NetworkGiffyDialog(
                            image: Image.asset(
                              "assets/gif/earth.gif",
                              fit: BoxFit.cover,
                            ),
                            title: Text('titleCard',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600)),
                            description: Text(
                              'descCard',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black26),
                            ),
                            onOkButtonPressed: () {
                              Navigator.pop(context);
                            },
                          ));
                },
                child: cardName(
                  flag: "assets/img/india.png",
                  title: 'hindi',
                )),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => NetworkGiffyDialog(
                            image: Image.asset(
                              "assets/gif/earth.gif",
                              fit: BoxFit.cover,
                            ),
                            title: Text('titleCard',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Gotik",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600)),
                            description: Text(
                              'descCard',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black26),
                            ),
                            onOkButtonPressed: () {
                              Navigator.pop(context);
                            },
                          ));
                },
                child: cardName(
                  flag: "assets/img/indonesia.png",
                  title: 'indonesia',
                )),
            SizedBox(
              height: 70.0,
            )
          ],
        ),
      ),
    );
  }
}

class cardName extends StatelessWidget {
  String title, flag;
  cardName({this.title, this.flag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      child: Container(
        height: 80.0,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  spreadRadius: 0.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 15.0),
          child: Row(children: <Widget>[
            Image.asset(
              flag,
              fit: BoxFit.cover,
              height: 65.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: "Popins",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.3),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
