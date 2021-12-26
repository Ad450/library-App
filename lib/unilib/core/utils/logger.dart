import 'package:logger/logger.dart';
// a logger that logs to the console all ongoing
// events in the app for easy debugging

final logger = Logger(
  printer: PrettyPrinter(
    colors: true,
    printEmojis: true,
    printTime: true,
    methodCount: 3,
  ),
);
