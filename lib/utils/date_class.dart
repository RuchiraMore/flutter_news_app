import 'package:intl/intl.dart';

class DateClass {

  static todayDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('EEE dd MMMM');//('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm:a').format(now);
    String formattedDate = formatter.format(now);
    print(formattedTime);
    print(formattedDate);
    return formattedDate.toUpperCase();
  }

  static convertDateToTime(String publishedDate){
    List trimTime = publishedDate.split('T');
    String trimmedTime = trimTime.last;
    List trimHours = trimmedTime.split(':');
    String publishedHours = trimHours.first + ' hours ago';

    return publishedHours;
  }

}