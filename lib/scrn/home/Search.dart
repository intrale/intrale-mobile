import 'package:flutter/material.dart';

class searchAppbar extends StatefulWidget {
  @override
  _searchAppbarState createState() => _searchAppbarState();
}

class _searchAppbarState extends State<searchAppbar> {
  @override
  Widget build(BuildContext context) {
    /// Sentence Text header "Hello i am Treva.........."
    var _textHello = Padding(
      padding: const EdgeInsets.only(right: 50.0, left: 20.0),
      child: Text(
        'searchHello',
        style: TextStyle(
            letterSpacing: 0.1,
            fontWeight: FontWeight.w600,
            fontSize: 27.0,
            color: Colors.black54,
            fontFamily: "Gotik"),
      ),
    );

    /// Item TextFromField Search
    var _search = Padding(
      padding: const EdgeInsets.only(top: 35.0, right: 20.0, left: 20.0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15.0,
                  spreadRadius: 0.0)
            ]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Theme(
              data: ThemeData(hintColor: Colors.transparent),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Color(0xFF6991C7),
                      size: 28.0,
                    ),
                    hintText: 'findYouWant',
                    hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Gotik",
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ),
        ),
      ),
    );

    /// Item Favorite Item with Card item
    var _favorite = Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: 250.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'favorite',
                style: TextStyle(fontFamily: "Gotik", color: Colors.black26),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 20.0, bottom: 2.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  /// Get class FavoriteItem
                  Padding(padding: EdgeInsets.only(left: 20.0)),
                  FavoriteItem(
                    image: "assets/imgItem/shoes1.jpg",
                    title: 'productTitle1',
                    Salary: "\$ 10",
                    Rating: "4.8",
                    sale: 'productSale1',
                  ),
                  Padding(padding: EdgeInsets.only(left: 20.0)),
                  FavoriteItem(
                    image: "assets/imgItem/acesoris1.jpg",
                    title: 'productTitle2',
                    Salary: "\$ 200",
                    Rating: "4.2",
                    sale: 'productSale2',
                  ),
                  Padding(padding: EdgeInsets.only(left: 20.0)),
                  FavoriteItem(
                    image: "assets/imgItem/kids1.jpg",
                    title: 'productTitle3',
                    Salary: "\$ 3",
                    Rating: "4.8",
                    sale: 'productSale3',
                  ),
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    /// Popular Keyword Item
    var _sugestedText = Container(
      height: 145.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Text(
              'popularity',
              style: TextStyle(fontFamily: "Gotik", color: Colors.black26),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 20.0)),
              KeywordItem(
                title: 'searchTitle1',
                title2: 'searchTitle2',
              ),
              KeywordItem(
                title: 'searchTitle3',
                title2: 'searchTitle4',
              ),
              KeywordItem(
                title: 'searchTitle5',
                title2: 'searchTitle6',
              ),
              KeywordItem(
                title: 'searchTitle7',
                title2: 'searchTitle8',
              ),
            ],
          ))
        ],
      ),
    );

    //var data = EasyLocalizationProvider.of(context).data;
    return /*EasyLocalizationProvider(
      data: data,
      child: */
        Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// Caliing a variable
                _textHello,
                _search,
                _sugestedText,
                _favorite,
                Padding(padding: EdgeInsets.only(bottom: 30.0, top: 2.0))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Popular Keyword Item class
class KeywordItem extends StatelessWidget {
  @override
  String title, title2;

  KeywordItem({required this.title, required this.title2});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 3.0),
          child: Container(
            height: 29.5,
            width: 90.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4.5,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: Center(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54, fontFamily: "Sans"),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Container(
          height: 29.5,
          width: 90.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4.5,
                spreadRadius: 1.0,
              )
            ],
          ),
          child: Center(
            child: Text(
              title2,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "Sans",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///Favorite Item Card
class FavoriteItem extends StatelessWidget {
  String image, Rating, Salary, title, sale;

  FavoriteItem(
      {required this.image,
      required this.Rating,
      required this.Salary,
      required this.title,
      required this.sale});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.15),
                blurRadius: 4.0,
                spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
              )
            ]),
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.0),
                          topRight: Radius.circular(7.0)),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    Salary,
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            Rating,
                            style: TextStyle(
                                fontFamily: "Sans",
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          )
                        ],
                      ),
                      Text(
                        sale,
                        style: TextStyle(
                            fontFamily: "Sans",
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
