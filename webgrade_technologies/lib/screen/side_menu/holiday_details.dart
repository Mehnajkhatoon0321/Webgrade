import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class HolidayDetails extends StatefulWidget {
  const HolidayDetails({super.key});

  @override
  State<HolidayDetails> createState() => _HolidayDetailsState();
}



class _HolidayDetailsState extends State<HolidayDetails> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  bool _showYearPicker = false;
  bool _showMonthPicker = false;

  // Sample data for multiple months
  final Map<String, Map<int, List<Map<String, String>>>> _events = {
    // Data for 2023
    "january": {
      2023: [
        {"date": "01-01-2023", "inTime": "10:00", "outTime": "12:00", "location": "Downtown"},
        {"date": "15-01-2023", "inTime": "09:00", "outTime": "11:00", "location": "Uptown"}
      ],
      2024: [
        {"date": "01-01-2024", "inTime": "10:00", "outTime": "12:00", "location": "Gomati Nagar"},
        {"date": "02-01-2024", "inTime": "10:00", "outTime": "12:00", "location": "Gomati Nagar"},
        {"date": "03-01-2024", "inTime": "10:00", "outTime": "12:00", "location": "Gomati Nagar"},
        {"date": "04-01-2024", "inTime": "10:00", "outTime": "12:00", "location": "Gomati Nagar"}
      ],

    },
    "february": {
      2023: [
        {"date": "01-02-2023", "inTime": "11:00", "outTime": "13:00", "location": "Midtown"},
        {"date": "20-02-2023", "inTime": "14:00", "outTime": "16:00", "location": "Suburbs"}
      ],
    },
    "march": {
      2023: [
        {"date": "10-03-2023", "inTime": "12:00", "outTime": "14:00", "location": "Central Park"},
        {"date": "25-03-2023", "inTime": "15:00", "outTime": "17:00", "location": "City Hall"}
      ],
    },
    "april": {
      2023: [
        {"date": "05-04-2023", "inTime": "10:00", "outTime": "12:00", "location": "Library"},
        {"date": "20-04-2023", "inTime": "09:00", "outTime": "11:00", "location": "Museum"}
      ],
    },
    // Data for 2024

  };

  void _onYearSelected(DateTime selectedYear) {
    setState(() {
      _focusedDay = DateTime(selectedYear.year, _focusedDay.month, _focusedDay.day);
      _showYearPicker = false;
    });
  }

  void _onMonthSelected(int month) {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, month, _focusedDay.day);
      _showMonthPicker = false;
    });
  }

  List<Map<String, String>> _getEventsForMonth(int month, int year) {
    final monthName = DateFormat('MMMM').format(DateTime(year, month)).toLowerCase();
    return _events[monthName]?[year] ?? [];
  }

  List<DateTime> _getAllDatesForMonth(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    List<DateTime> allDates = [];

    for (DateTime day = firstDayOfMonth; day.isBefore(lastDayOfMonth.add(Duration(days: 1))); day = day.add(Duration(days: 1))) {
      allDates.add(day);
    }

    return allDates;
  }

  int _calculateNumberOfSundaysInMonth(DateTime date) {
    int numberOfSundays = 0;
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);

    for (DateTime day = firstDayOfMonth; day.isBefore(lastDayOfMonth.add(Duration(days: 1))); day = day.add(Duration(days: 1))) {
      if (day.weekday == DateTime.sunday) {
        numberOfSundays++;
      }
    }

    return numberOfSundays;
  }

  Map<String, int> _calculatePresentAndAbsentForDate(DateTime date) {
    final month = date.month;
    final year = date.year;
    final events = _getEventsForMonth(month, year);

    final allDates = _getAllDatesForMonth(date);
    final eventDates = events.map((e) => DateFormat('dd-MM-yyyy').parse(e['date']!)).toSet();

    final presentDays = eventDates.length;
    final totalDays = allDates.length;
    final absentDays = totalDays - presentDays;

    return {'presentDays': presentDays, 'absentDays': absentDays};
  }

  @override
  Widget build(BuildContext context) {
    final events = _getEventsForMonth(_focusedDay.month, _focusedDay.year);
    final allDates = _getAllDatesForMonth(_focusedDay);
    final eventDates = events.map((e) => DateFormat('dd-MM-yyyy').parse(e['date']!)).toSet();
    final totalDays = allDates.length;
    final presentDays = eventDates.length;
    final absentDays = totalDays - presentDays;

    final dateToCheck = DateTime(2024, 9, 13);
    final presentAbsentData = _calculatePresentAndAbsentForDate(dateToCheck);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Holiday Details',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Custom header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showYearPicker = !_showYearPicker;
                                  if (_showMonthPicker) _showMonthPicker = false;
                                });
                              },
                              child: Text(
                                DateFormat('yyyy').format(_focusedDay),
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showMonthPicker = !_showMonthPicker;
                                  if (_showYearPicker) _showYearPicker = false;
                                });
                              },
                              child: Text(
                                DateFormat('MMMM').format(_focusedDay),
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        if (_showYearPicker)
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: 11, // Adjust the count as needed
                              itemBuilder: (context, index) {
                                final year = 2023 + index; // Start from 2023
                                return ListTile(
                                  title: Text(year.toString()),
                                  onTap: () => _onYearSelected(DateTime(year)),
                                );
                              },
                            ),
                          ),
                        if (_showMonthPicker)
                          SizedBox(
                            height: 200,
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                final month = index + 1;
                                return GestureDetector(
                                  onTap: () => _onMonthSelected(month),
                                  child: Card(
                                    child: Center(
                                      child: Text(DateFormat('MMMM').format(DateTime(2024, month))),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TableCalendar(
                          focusedDay: _focusedDay,
                          firstDay: DateTime.utc(2020, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          calendarFormat: _calendarFormat,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          },
                          onPageChanged: (focusedDay) {
                            setState(() {
                              _focusedDay = focusedDay;
                            });
                          },
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: false,
                            leftChevronVisible: false,
                            rightChevronVisible: false,
                          ),
                          calendarStyle: const CalendarStyle(
                            todayDecoration: BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          daysOfWeekStyle: const DaysOfWeekStyle(
                            weekendStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Total holidays (Sundays) in this month: ${_calculateNumberOfSundaysInMonth(_focusedDay)}',
                          style: const TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Total present days: $presentDays',
                          style: const TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Total absent days: $absentDays',
                          style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: ListView(
                            children: events.isNotEmpty
                                ? events.map((event) {
                              return ListTile(
                                title: Text('Date: ${event['date']}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('In Time: ${event['inTime']}'),
                                    Text('Out Time: ${event['outTime']}'),
                                    Text('Location: ${event['location']}'),
                                  ],
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                              );
                            }).toList()
                                : [const ListTile(title: Text(''))],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


