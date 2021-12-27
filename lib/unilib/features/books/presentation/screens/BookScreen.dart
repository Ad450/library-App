import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_project/unilib/features/books/presentation/state/book_cubit.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      buildWhen: (previousState, newState) => previousState != newState,
      builder: (_, state) =>
          Column(children: <Widget>[
          ],),
    );
  }
}
