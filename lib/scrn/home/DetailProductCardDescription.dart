import 'package:flutter/material.dart';
import 'package:intrale/model/Product.dart';

const TextStyle VIEW_MORE_TEXT_STYLE = TextStyle(
  color: Colors.indigoAccent,
  fontSize: 15.0,
  fontFamily: "Gotik",
  fontWeight: FontWeight.w700,
);

const TextStyle SUB_HEADER_CUSTOM_TEXT_STYLE = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w700,
    fontFamily: "Gotik",
    fontSize: 16.0);

const TextStyle DETAIL_TEXT_STYLE = TextStyle(
    fontFamily: "Gotik",
    color: Colors.black54,
    letterSpacing: 0.3,
    wordSpacing: 0.5);

class DetailProductCardDescription extends StatelessWidget {
  Product gridItem;
  DetailProductCardDescription(this.gridItem);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: 600.0,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0xFF656565).withOpacity(0.15),
            blurRadius: 1.0,
            spreadRadius: 0.2,
          )
        ]),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  'description',
                  style: SUB_HEADER_CUSTOM_TEXT_STYLE,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, right: 20.0, bottom: 10.0, left: 20.0),
                child: Text(gridItem.description, style: DETAIL_TEXT_STYLE),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      /*_bottomSheet();*/
                    },
                    child: Text(
                      'viewMore',
                      style: VIEW_MORE_TEXT_STYLE,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
