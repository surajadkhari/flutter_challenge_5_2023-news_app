import 'package:intl/intl.dart';

class DateTimeParse {
  String getSuffix(int day) {
    // Returns the suffix for a given day (e.g., "st" for 1, "nd" for 2, "rd" for 3, etc.)
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String formatDate(String dateString, String formate) {
    // Parse the input date string into a DateTime object
    String paddedDateString = dateString.replaceAllMapped(
      RegExp(r'^(\d{4})-(\d{1,2})-(\d{1,2})$'),
      (match) =>
          '${match.group(1)}-${match.group(2)!.padLeft(2, '0')}-${match.group(3)!.padLeft(2, '0')}',
    );

    // Parse the input date string into a DateTime object
    DateTime date = DateTime.parse(paddedDateString);

    // Use the DateFormat class to format the date string in the desired format
    DateFormat formatter = DateFormat(formate);
    return formatter.format(date);
  }
}
