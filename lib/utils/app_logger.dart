import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class AppLogger {
  static final logger = Logger(
    printer: PrettyPrinter(
        // Number of method calls to be displayed
        methodCount: 2,
        // number of method calls if stacktrace is provided
        errorMethodCount: 8,
        // width of the output
        lineLength: 200,
        // Colorful log messages
        colors: true,
        // Print an emoji for each log message
        printEmojis: true,
        // Should each log print contain a timestamp
        printTime: false),
  );

  static void i(dynamic message) {
    logger.i(message);
  }

  static void d(dynamic message) {
    logger.d(message);
  }

  static void w(dynamic message) {
    logger.w(message);
  }

  static void e(dynamic message) {
    logger.e(message);
  }

  static void wtf(dynamic message) {
    logger.wtf(message);
  }
}
