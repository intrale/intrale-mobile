import 'package:intrale/comp/Language_Library/lib/easy_localization_delegate.dart';
import 'package:intrale/comp/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:intrale/model/notificationsData.dart';

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  final List<Post> items = new List();
  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(
        Post(
            image: "assets/img/Logo.png",
            id: 1,
            title: "Intrale App",
            desc: "Gracias por descargar nuestra aplicación"),
      );
      items.add(
        Post(
            image: "assets/img/Logo.png",
            id: 2,
            title: "Intrale App",
            desc: "Tu orden esta siendo procesada"),
      );
      items.add(
        Post(
            image: "assets/img/Logo.png",
            id: 3,
            title: "Intrale App",
            desc: "Tenes productos pendientes en tu carrito"),
      );
      items.add(
        Post(
            image: "assets/img/Logo.png",
            id: 4,
            title: "Intrale App",
            desc: "Obten un 10% de descuento en macbook pro 2018"),
      );
    });
  }

  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context).tr('notification'),
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black54,
                  fontFamily: "Gotik"),
            ),
            iconTheme: IconThemeData(
              color: const Color(0xFF6991C7),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: items.length > 0
              ? ListView.builder(
                  itemCount: items.length,
                  padding: const EdgeInsets.all(5.0),
                  itemBuilder: (context, position) {
                    return Dismissible(
                        key: Key(items[position].id.toString()),
                        onDismissed: (direction) {
                          setState(() {
                            items.removeAt(position);
                          });
                        },
                        background: Container(
                          color: Color(0xFF6991C7),
                        ),
                        child: Container(
                          height: 88.0,
                          child: Column(
                            children: <Widget>[
                              Divider(height: 5.0),
                              ListTile(
                                title: Text(
                                  '${items[position].title}',
                                  style: TextStyle(
                                      fontSize: 17.5,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Container(
                                    width: 440.0,
                                    child: Text(
                                      '${items[position].desc}',
                                      style: new TextStyle(
                                          fontSize: 15.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black38),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                leading: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(60.0)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  '${items[position].image}'),
                                              fit: BoxFit.cover)),
                                    )
                                  ],
                                ),
                                onTap: () =>
                                    _onTapItem(context, items[position]),
                              ),
                              Divider(height: 5.0),
                            ],
                          ),
                        ));
                  })
              : noItemNotifications()),
    );
  }
}

void _onTapItem(BuildContext context, Post post) {
  Scaffold.of(context).showSnackBar(
      new SnackBar(content: new Text(post.id.toString() + ' - ' + post.title)));
}

class noItemNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: 500.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: mediaQueryData.padding.top + 100.0)),
            Image.asset(
              "assets/img/noNotification.png",
              height: 200.0,
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Text(
              AppLocalizations.of(context).tr('notHaveNotification'),
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.5,
                  color: Colors.black54,
                  fontFamily: "Gotik"),
            ),
          ],
        ),
      ),
    );
  }
}
