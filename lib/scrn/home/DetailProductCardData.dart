import 'package:flutter/material.dart';
import 'package:intrale/model/Product.dart';

const TextStyle CUSTOM_TEXT_STYLE = TextStyle(
  color: Colors.black,
  fontFamily: "Gotik",
  fontSize: 17.0,
  fontWeight: FontWeight.w800,
);

class DetailProductCardData extends StatelessWidget {
  Product? gridItem;
  DetailProductCardData(this.gridItem);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Color(0xFF656565).withOpacity(0.15),
          blurRadius: 1.0,
          spreadRadius: 0.2,
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              gridItem!.name,
              style: CUSTOM_TEXT_STYLE,
            ),
            Padding(padding: EdgeInsets.only(top: 5.0)),
            Text(
              gridItem!.price.unitPrice.toString(),
              style: CUSTOM_TEXT_STYLE,
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "5.0",
                              /*gridItem.rattingValue,*/
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(padding: EdgeInsets.only(left: 8.0)),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 19.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      "itemSale",
                      /*gridItem.itemSale,*/
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
