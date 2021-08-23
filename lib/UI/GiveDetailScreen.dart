import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/Widgets/Overview.dart';
import 'package:library_project/Widgets/profile.dart';

class GiveDetailsScreen extends StatefulWidget {
  const GiveDetailsScreen({Key? key}) : super(key: key);

  static final detailsUrl = "/booksPage";

  @override
  _GiveDetailsScreenState createState() => _GiveDetailsScreenState();
}

class _GiveDetailsScreenState extends State<GiveDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool _profileIsClicked = false;
  bool _overviewIsClicked = false;
  int _currentIndex = 0;

  @override
  void initState() {
    _tabController =
        TabController(initialIndex: _currentIndex, vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> _tabs = [
      Tab(
        child: Text(
          "profile",
          style: GoogleFonts.quicksand(fontSize: 25),
        ),
      ),
      Tab(
        child: Text(
          "overview",
          style: GoogleFonts.quicksand(
            fontSize: 25,
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          leading: IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_left_outlined)),
          backgroundColor: Colors.white,
          title: Text(
            "Profile",
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          bottom: TabBar(
            //indicatorPadding: EdgeInsets.only(left: 20, right: 20),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            labelStyle: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              color: Colors.white,
            ),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _tabController!.animateTo(_currentIndex);
              });
            },
            controller: _tabController,
            tabs: _tabs,
          ),
        ),
        preferredSize: Size.fromHeight(150),
      ),
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[Profile(), OverView()]),
    );
  }
}
