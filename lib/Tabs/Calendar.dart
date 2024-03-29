import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class NotificationsTab extends StatefulWidget {
  const NotificationsTab({ super.key });

  @override
  State<NotificationsTab> createState()=>NotificationsTabState();
}


class Event {
  final String name;
  Event(this.name);
}

class NotificationsTabState extends State<NotificationsTab>{
  DateTime today = DateTime.now();
  Map<DateTime, List<Event>> events = {};
  late ValueNotifier<DateTime> _focusedDay;
  
  
    void _onDaySelected(DateTime selectedDay,DateTime focusedDay,){
      setState((){
        today = selectedDay;
        final selectedEvents = _getEventsForDay(selectedDay);
        if (selectedEvents.isNotEmpty) {
          print('Events for $selectedDay: ${selectedEvents.map((e) => e.name).join(', ')}');
        }
      });
    }

    void _onPageChanged(DateTime pageStartDate) {
   _focusedDay.value = pageStartDate;
}

    List<Event> _getEventsForDay(DateTime day){
      return events[day] ?? [];
    }

    @override
    void initState() {
      super.initState();
      _focusedDay = ValueNotifier<DateTime>(DateTime.utc(2024,1,15));
      events[DateTime(2024, 2, 14)] = [Event("Svetivalentin")];
      events[DateTime(2024, 2, 14)] = [Event("enshto")];
      events[DateTime(2024, 3, 8)] = [Event("woman's day")];
  }
    
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        child: ValueListenableBuilder(
          valueListenable: _focusedDay,

          
          builder: (context, DateTime focusedDay, _) {

            
            return TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle: const HeaderStyle(formatButtonVisible:true, titleCentered:true,),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              eventLoader: (day) {
                return _getEventsForDay(day);
              },

              
              focusedDay: focusedDay,

              firstDay: DateTime.utc(2024,1,10),
              lastDay:  DateTime.utc(2040,1,10),
              onDaySelected: _onDaySelected,
              onPageChanged: _onPageChanged,
            );
          },
        ),
      ),
    ],
  );
}



}