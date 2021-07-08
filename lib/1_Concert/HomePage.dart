import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
//        accentColor: Color.fromARGB(255, 84, 35, 189),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Color.fromARGB(255, 96, 50, 233),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 96, 50, 233),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: Scaffold(
        floatingActionButton: Container(
          width: 45,
          child: FloatingActionButton(
              onPressed: () {}, child: Icon(Icons.location_on)),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              flexibleSpace: buildSearch(),
              backgroundColor: Color.fromARGB(255, 96, 50, 233),
              expandedHeight: 100,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [buildEvents()],
              ),
            ),
          ],
        ),
        bottomNavigationBar: buildButtons(),
      ),
    );
  }

  Widget buildSearch() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 84, 50, 189),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              contentPadding: EdgeInsets.all(20),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEvents() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: DefaultTabController(
          length: 2,
          child: Column(children: <Widget>[
            Container(
              width: double.infinity,
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: Color.fromARGB(255, 124, 195, 227),
                  ),
                ),
                isScrollable: true,
                tabs: [
                  Tab(
                      child: Text("Events",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                  Tab(
                      child: Text("Categories",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold)))
                ],
              ),
            ),
            Container(
                height: 500,
                child: TabBarView(
//                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Container(
                        child: Column(children: <Widget>[
                          Container(height: 40),
                          buildTags(),
                          Container(height: 30),
                          buildPopular(),
                          Container(height: 30),
                          buildNearby(),
                        ]),
                      ),
                      Container(
                        child: Column(children: <Widget>[
                          Text("Categories"),
                        ]),
                      ),
                    ]))
          ])),
    );
  }

  Widget buildTags() {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          tagCard("All"),
          Container(width: 10),
          tagCard("💪 Sports"),
          Container(width: 10),
          tagCard("🎉 Birthdays"),
          Container(width: 10),
          tagCard("🎸  Concerts"),
          Container(width: 10),
          tagCard("🍾  Partys"),
        ],
      ),
    );
  }

  Widget tagCard(String text) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 124, 195, 227),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Center(child: Text(text)),
        ));
  }

  Widget buildPopular() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Popular Events'),
        Container(height: 12),
        Container(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              eventCard(
                  "Taylor Swift",
                  "Wien, 21 Aug",
                  "Club Devil, 5th Avenue, 287",
                  Color.fromARGB(255, 252, 212, 104)),
              Container(width: 14),
              eventCard(
                  "Taylor Swift",
                  "Wien, 21 Aug",
                  "Club Devil, 5th Avenue, 287",
                  Color.fromARGB(255, 176, 233, 216)),
              Container(width: 14),
              eventCard("Taylor Swift", "Wien, 21 Aug",
                  "Club Devil, 5th Avenue, 287", Colors.indigoAccent),
              Container(width: 14),
              eventCard("Taylor Swift", "Wien, 21 Aug",
                  "Club Devil, 5th Avenue, 287", Colors.yellow),
            ],
          ),
        ),
      ],
    );
  }

  Widget eventCard(
      String title, String location_date, String detail, Color color) {
    return Container(
        width: 300,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                    flex: 4,
                    child: Center(
                        child: Text(title,
                            style: GoogleFonts.poppins(
                                fontSize: 30, fontWeight: FontWeight.bold)))),
                Flexible(
                    flex: 1,
                    child: Text(location_date,
                        style: TextStyle(color: Colors.black))),
                Flexible(
                    flex: 1,
                    child: Text(detail,
                        style: TextStyle(fontSize: 12, color: Colors.black54))),
              ]),
        ));
  }

  Widget buildNearby() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nearby Concerts'),
        Container(height: 12),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              consertsCard(),
              Container(width: 14),
              consertsCard(),
              Container(width: 14),
              consertsCard(),
              Container(width: 14),
              consertsCard(),
              Container(width: 14),

            ],
          ),
        ),
      ],
    );
  }

  Widget consertsCard() {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 84, 50, 189),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(),
    );
  }

  Widget buildButtons() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.widgets,
            size: 30,
          ),
          Icon(
            Icons.search,
            size: 30,
          ),
          Icon(
            Icons.add_circle_outline,
            size: 30,
          ),
          Icon(
            Icons.send,
            size: 30,
          ),
          Icon(
            Icons.people,
            size: 30,
          ),
        ],
      ),
    );
  }
}
