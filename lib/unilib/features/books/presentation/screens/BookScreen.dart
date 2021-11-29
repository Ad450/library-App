import 'package:flutter/material.dart';
import 'package:library_project/unilib/core/presentation/widgets/book_card.dart';
import 'package:library_project/unilib/core/presentation/widgets/header.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/LoadingScreen.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 2), () => 45),
          builder: (context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError)
              return Scaffold(
                body: Center(
                  child: Text("error occured, please try again"),
                ),
              );

            if (!snapshot.hasData) return LoadingScreen();

            return _BookContent();
          }),
    );
  }
}

class _BookContent extends StatelessWidget {
  const _BookContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 10, right: 25, top: 15),
            child: Header(
              headerText: "Library",
              trailingText: "see all",
              leadingIcon: Icon(Icons.menu),
              trailingIcon: Icon(Icons.search),
              trailingTextTapped: () {},
              trailingWidget: Container(
                child: CircleAvatar(
                  child: Icon(Icons.person, color: Colors.black54),
                  radius: 15,
                  backgroundColor: Colors.amberAccent,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: BooksOnScroll(),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

// have to use a stream builder to keep state running
// Future builder runs once

class BooksOnScroll extends StatelessWidget {
  const BooksOnScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2), () => 45),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError)
            return Column(
              children: [
                Center(child: Text("please try again")),
              ],
            );
          if (!snapshot.hasData)
            return Center(
                child: CircularProgressIndicator(
              color: Colors.amberAccent,
            ));

          return BooksScrollView();
        },
      ),
    );
  }
}

class BooksScrollView extends StatelessWidget {
  const BooksScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ..._trialBooks.map((bookCard) => Row(
                children: [
                  bookCard,
                  SizedBox(
                    width: 20,
                  )
                ],
              ))
        ],
      ),
    ));
  }
}

List<BookCard> _trialBooks = <BookCard>[
  BookCard(
    child: Container(),
    color: Colors.red,
  ),
  BookCard(
    child: Container(),
    color: Colors.yellow,
  ),
  BookCard(
    child: Container(),
    color: Colors.green,
  )
];
