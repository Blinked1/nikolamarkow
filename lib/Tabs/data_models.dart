class Subject {
  String teacher = '';
  double timetable = 0;
  double subjectNumber = 0;
}

class DaySchedule{
  DateTime date = DateTime.now();
  List<Subject> subjects = List<Subject>.empty();
}
