import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

class AppointmentsRecord {
  final DateTime start;
  final DateTime end;
  final String custumer;

  AppointmentsRecord({
    required this.start,
    required this.end,
    required this.custumer,
  });
}

class CustomColorsv2{
  final Color primary = const Color(0xFF8BA6D5);
  final Color accent = const Color(0xFF7898CE);
  final Color background = const Color(0xFFFBFCFE);
  final Color secondary = const Color(0xFFE9EEF7);
  final Color text = const Color(0xFF05090F);
}
class CustomColors{
  final Color primary = const Color(0xFF438DC7);
  final Color accent = const Color(0xFF3780B9);
  final Color background = const Color(0xFFF7FAFD);
  final Color secondary = const Color(0xFFFFFFFF);
  final Color text = const Color(0xFF0C1B27);
}
class CustomColorsv1{
  final Color primary = const Color(0xFF999EF4);
  final Color accent = const Color(0xFF8288F2);
  final Color background = const Color(0xFFD1D3FA);
  final Color secondary = const Color(0xFFE3E5FC);
  final Color text = const Color(0xFF05072E);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CustomColors _customColors= CustomColors();
  @override
  Widget build(BuildContext context) {
    List<AppointmentsRecord> appointments = [
      AppointmentsRecord( 
        start: DateTime.now(),
        end: DateTime.now().add(Duration(hours: 1)),
        custumer: "John Doe",
      ),
      AppointmentsRecord(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(hours: 1)),
        custumer: "Ewerton",
      ),
      AppointmentsRecord(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(hours: 1)),
        custumer: "Lara",
      ),
      AppointmentsRecord(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(hours: 1)),
        custumer: "Guilherme",
      ),
      AppointmentsRecord(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(hours: 1)),
        custumer: "Hugo",
      ),
      AppointmentsRecord(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(hours: 1)),
        custumer: "Caio",
      ),
      AppointmentsRecord(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(hours: 1)),
        custumer: "John Doe",
      ),
      AppointmentsRecord(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(hours: 1)),
        custumer: "John Doe",
      ),
      AppointmentsRecord(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(hours: 1)),
        custumer: "John Doe",
      ),
      AppointmentsRecord(
        start: DateTime.now().add(Duration(days: 1)),
        end: DateTime.now().add(Duration(days: 1, hours: 3)),
        custumer: "Jane Smith",
      ),
      AppointmentsRecord(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(hours: 1)),
    custumer: "John Doe",
  ),
  AppointmentsRecord(
    start: DateTime.now().add(Duration(days: 1)),  
    end: DateTime.now().add(Duration(days: 1, hours: 5)),
    custumer: "Jane Smith",
  ),
  AppointmentsRecord(
    start: DateTime.now().add(Duration(days: 2)),
    end: DateTime.now().add(Duration(days: 2, hours: 2)),
    custumer: "Alice Johnson",
  ),
  AppointmentsRecord(
    start: DateTime.now().add(Duration(days: 3)),
    end: DateTime.now().add(Duration(days: 3, hours: 8)),
    custumer: "Michael Brown",
  ),
  AppointmentsRecord(
    start: DateTime.now().add(Duration(days: 4)),
    end: DateTime.now().add(Duration(days: 4, hours: 5)),
    custumer: "Emily Davis",
  ),
  AppointmentsRecord(
    start: DateTime.now().add(Duration(days: 5)),
    end: DateTime.now().add(Duration(days: 5, hours: 3)),
    custumer: "Daniel Wilson",
  ),
  AppointmentsRecord(
    start: DateTime.now().add(Duration(days: 6)),
    end: DateTime.now().add(Duration(days: 6, hours: 2)),
    custumer: "Olivia Taylor",
  ),
  AppointmentsRecord(
    start: DateTime.now().add(Duration(days: 7)),
    end: DateTime.now().add(Duration(days: 7, hours: 6)),
    custumer: "William Martinez",
  ),
  AppointmentsRecord(
    start: DateTime.now().add(Duration(days: 8)),
    end: DateTime.now().add(Duration(days: 8, hours: 2)),
    custumer: "Sophia Anderson",
  ),
  AppointmentsRecord(
    start: DateTime.now().add(Duration(days: 9)),
    end: DateTime.now().add(Duration(days: 9, hours: 9)),
    custumer: "James Thompson",
  ),
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: _customColors.background,
        appBar: AppBar(
          title: const Text('Appointments'),
          backgroundColor: _customColors.primary,
        ),
        body: WeekCalendar(appointments: appointments),
      ),
    );
  }
}

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({
    Key? key,
    this.width,
    this.height,
    required this.appointments,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<AppointmentsRecord> appointments;

  @override
  _WeekCalendarState createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  DateTime _selectedDate = DateTime.now();
  final CustomColors _customColors = CustomColors();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _dateBar(),
        _showAppointments()
      ]
    );
  }

  Widget _dateBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color:Color(0xFFF7FAFD),
      ),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: _customColors.primary,
        monthTextStyle: TextStyle(color: _customColors.text, fontSize: 13, fontWeight: FontWeight.w400),
        dayTextStyle: TextStyle(color: _customColors.text, fontSize: 13, fontWeight: FontWeight.w400),
        dateTextStyle: TextStyle(color: _customColors.text, fontSize: 22, fontWeight: FontWeight.w500),
        locale: "es",
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }

  Widget _showAppointments() {
    bool _left = false;
    bool _right = false;
    if (widget.appointments.isEmpty) {
      return _noAppointments();
    } else {
      return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: widget.appointments.length,
            itemBuilder: (context, index) {
      
              //getting time of appointments
              String startTime =
                  DateFormat('HH:mm').format(widget.appointments[index].start);
              String endTime =
                  DateFormat('HH:mm').format(widget.appointments[index].end);
      
              //checking if the appointment is on the day selected
              if (DateFormat('dd MMM yyyy').format(widget.appointments[index].start) ==
                  DateFormat('dd MMM yyyy').format(_selectedDate)) {
                return _appointmentV2(index,80);
              } else {
                return Container();
              }
            },
          ),
      );
    }
  }

  Widget _noAppointments() {
    return Container(
      height: 0,
    );
  }

  Widget _appointment(int index, double height){
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(1, 7), // Cambia la posición de la sombra (eje X, eje Y)
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: height,
            width: 13,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                color: _customColors.primary,
              ),
          ),
          Expanded(
            child: Container(
              height: height,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          widget.appointments[index].custumer,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _customColors.text,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric( horizontal: 10),
                        child: Text(
                          "${DateFormat('h:mm a').format(widget.appointments[index].start)} - ${DateFormat('h:mm a').format(widget.appointments[index].end)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: _customColors.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appointmentV2(int index, double height){
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(1, 7), // Cambia la posición de la sombra (eje X, eje Y)
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: height,
            width: 13,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                color: _customColors.primary,
              ),
          ),
          Expanded(
            child: Container(
              height: height,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          widget.appointments[index].custumer,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _customColors.text,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric( horizontal: 10),
                        child: Text(
                          "${DateFormat('h:mm a').format(widget.appointments[index].start)} - ${DateFormat('h:mm a').format(widget.appointments[index].end)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: _customColors.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}   
