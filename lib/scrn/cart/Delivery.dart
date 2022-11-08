import 'package:flutter/material.dart';
import 'package:intrale/scrn/cart/Payment.dart';
//TODO: Revisar si es necesario este componente
class delivery1 extends StatefulWidget {
  @override
  _deliveryState createState() => _deliveryState();
}

class _deliveryState extends State<delivery1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        title: Text(
          'deliveryAppBar',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
              color: Colors.black54,
              fontFamily: "Gotik"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Text(
                  'deliveryLocation',
                  style: TextStyle(
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w600,
                      fontSize: 25.0,
                      color: Colors.black54,
                      fontFamily: "Gotik"),
                ),
                Padding(padding: EdgeInsets.only(top: 50.0)),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'pinCode',
                      hintText: 'pinCode',
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'locality',
                      hintText: 'locality',
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'city',
                      hintText: 'city',
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'state',
                      hintText: 'state',
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
                Padding(padding: EdgeInsets.only(top: 80.0)),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => payment1()));
                  },
                  child: Container(
                    height: 55.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    child: Center(
                      child: Text(
                        'goPayment',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.5,
                            letterSpacing: 1.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
