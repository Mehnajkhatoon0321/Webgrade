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
    'january': {
      2024: [
        {
          'date': '10-01-2024',
          'location': 'Office',
          'inTime': '09:00 AM',
          'outTime': '05:00 PM'
        },
        {
          'date': '22-01-2024',
          'location': 'Office',
          'inTime': '09:00 AM',
          'outTime': '05:00 PM'
        },
      ],
    },
    'february': {
      2024: [
        {
          'date': '05-02-2024',
          'location': 'Office',
          'inTime': '09:00 AM',
          'outTime': '05:00 PM'
        },
        {
          'date': '19-02-2024',
          'location': 'Office',
          'inTime': '09:00 AM',
          'outTime': '05:00 PM'
        },
      ],
    },
    'march': {
      2024: [
        {
          'date': '15-03-2024',
          'location': 'Office',
          'inTime': '09:00 AM',
          'outTime': '05:00 PM'
        },
      ],
    },
    // Add more data as needed
  };

  void _onYearSelected(DateTime selectedYear) {
    setState(() {
      _focusedDay =
          DateTime(selectedYear.year, _focusedDay.month, _focusedDay.day);
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
    final monthName =
        DateFormat('MMMM').format(DateTime(year, month)).toLowerCase();
    List<Map<String, String>> events = _events[monthName]?[year] ?? [];

    // Filter out events that are in the future
    events.removeWhere((event) {
      final eventDate = DateFormat('dd-MM-yyyy').parse(event['date']!);
      return eventDate.isAfter(DateTime.now());
    });

    return events;
  }

  List<DateTime> _getAllDatesForMonth(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    List<DateTime> allDates = [];

    for (DateTime day = firstDayOfMonth;
        day.isBefore(lastDayOfMonth.add(Duration(days: 1)));
        day = day.add(Duration(days: 1))) {
      allDates.add(day);
    }

    return allDates;
  }

  int _calculateNumberOfSundaysInMonth(DateTime date) {
    int numberOfSundays = 0;
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);

    for (DateTime day = firstDayOfMonth;
        day.isBefore(lastDayOfMonth.add(Duration(days: 1)));
        day = day.add(Duration(days: 1))) {
      if (day.weekday == DateTime.sunday) {
        numberOfSundays++;
      }
    }

    return numberOfSundays;
  }

  Map<DateTime, bool> _getPresenceMap() {
    final events = _getEventsForMonth(_focusedDay.month, _focusedDay.year);
    final presenceMap = <DateTime, bool>{};

    for (var event in events) {
      final date = DateFormat('dd-MM-yyyy').parse(event['date']!);
      presenceMap[DateTime(date.year, date.month, date.day)] = true;
    }

    return presenceMap;
  }

  bool _isEventOnDay(DateTime day) {
    final events = _getEventsForMonth(day.month, day.year);
    return events.any((event) {
      final eventDate = DateFormat('dd-MM-yyyy').parse(event['date']!);
      return day.year == eventDate.year &&
          day.month == eventDate.month &&
          day.day == eventDate.day;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    final presenceMap = _getPresenceMap();
    final allDatesInMonth = _getAllDatesForMonth(_focusedDay);
    int presentDays = presenceMap.length;

    // Total days in the month
    int totalDays = allDatesInMonth.length;

    // Calculate number of Sundays
    int numberOfSundays = _calculateNumberOfSundaysInMonth(_focusedDay);

    // Absent days calculation: total days - present days - number of Sundays
    int absentDays = totalDays - presentDays - numberOfSundays;

    // Determine if the selected month is in the future
    bool isFutureMonth = _focusedDay.year > DateTime.now().year ||
        (_focusedDay.year == DateTime.now().year &&
            _focusedDay.month > DateTime.now().month);

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
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
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          if (_showYearPicker)
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: 11,
                                itemBuilder: (context, index) {
                                  final year = 2023 + index;
                                  return ListTile(
                                    title: Text(year.toString()),
                                    onTap: () =>
                                        _onYearSelected(DateTime(year)),
                                  );
                                },
                              ),
                            ),
                          if (_showMonthPicker)
                            SizedBox(
                              height: 200,
                              child: GridView.builder(
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                itemCount: 12,
                                itemBuilder: (context, index) {
                                  final month = index + 1;
                                  return GestureDetector(
                                    onTap: () => _onMonthSelected(month),
                                    child: Card(
                                      child: Center(
                                        child: Text(DateFormat('MMMM')
                                            .format(DateTime(2024, month))),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
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
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                        weekendDecoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekendStyle: TextStyle(color: Colors.red),
                      ),
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          if (day.isAfter(DateTime.now())) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: Text('${day.day}',
                                        style: TextStyle(
                                            color: Colors.white))),
                              ),
                            );
                          }

                          final isSunday = day.weekday == DateTime.sunday;
                          final isPresent = presenceMap.containsKey(day);
                          final hasEvent = _isEventOnDay(day);

                          Color color;
                          if (isSunday && hasEvent) {
                            color = Colors.green;
                          } else if (isSunday) {
                            color = Colors.blue;
                          } else if (isPresent) {
                            color = Colors.blue;
                          } else if (hasEvent) {
                            color = Colors.green;
                          } else {
                            color = Colors.redAccent;
                          }

                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Text('${day.day}',
                                      style: TextStyle(
                                          color: Colors.white))),
                            ),
                          );
                        },
                        todayBuilder: (context, day, focusedDay) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Text('${day.day}',
                                      style: TextStyle(
                                          color: Colors.white))),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    if (!isFutureMonth) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total present days: $presentDays',
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Total absent days: $absentDays',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total holidays (Sundays) in this month: $numberOfSundays',
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                    SizedBox(height: 20),
                    SizedBox(
                      height: 300, // Adjust height as needed
                      child: ListView(
                        children: _getEventsForMonth(
                            _focusedDay.month, _focusedDay.year)
                            .isNotEmpty
                            ? _getEventsForMonth(
                            _focusedDay.month, _focusedDay.year)
                            .map((event) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 3,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text('Date: ${event['date']}'),
                                    Text('Location: ${event['location']}'),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('In Time: ${event['inTime']}'),
                                        Text('Out Time: ${event['outTime']}'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList()
                            : [const ListTile(title: Text('No Events'))],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
