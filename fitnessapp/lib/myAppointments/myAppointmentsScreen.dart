import 'dart:collection';

import 'package:fitnessapp/UIview/runningView.dart';
import 'package:fitnessapp/enums/appointment_type.dart';
import 'package:fitnessapp/helpers/util.dart';
import 'package:fitnessapp/models/my_appointments.dart';
import 'package:fitnessapp/widget/app_bar_ui.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../fintnessAppTheme.dart';

class MyAppointmentsScreen extends StatefulWidget {
  final AnimationController? animationController;

  const MyAppointmentsScreen({Key? key, required this.animationController})
      : super(key: key);
  @override
  _MyAppointmentsScreenState createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen>
    with TickerProviderStateMixin {
  List<Widget> listViews = [];

  var scrollController = ScrollController();

  double topBarOpacity = 0.0;

  late final PageController _pageController;

  late ValueNotifier<List<MyAppointments>> _selectedAppointments;

  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    _selectedDays.add(_focusedDay.value);
    _selectedAppointments =
        ValueNotifier(_getAppointmentsForDay(_focusedDay.value));

    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedAppointments.dispose();
    super.dispose();
  }

  bool get canClearSelection =>
      _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  List<MyAppointments> _getAppointmentsForDay(DateTime day) {
    return dummyAppointments[day] ?? [];
  }

  List<MyAppointments> _getAppointmentsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getAppointmentsForDay(d),
    ];
  }

  List<MyAppointments> _getAppointmentsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return _getAppointmentsForDays(days);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }

      _focusedDay.value = focusedDay;
      _rangeStart = null;
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });

    _selectedAppointments.value = _getAppointmentsForDays(_selectedDays);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _selectedDays.clear();
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedAppointments.value = _getAppointmentsForRange(start, end);
    } else if (start != null) {
      _selectedAppointments.value = _getAppointmentsForDay(start);
    } else if (end != null) {
      _selectedAppointments.value = _getAppointmentsForDay(end);
    }
  }

  void addAllListData() {
    var count = 9;

    listViews.add(Column(
      children: [
        ValueListenableBuilder<DateTime>(
          valueListenable: _focusedDay,
          builder: (context, value, _) {
            return _CalendarHeader(
              focusedDay: value,
              clearButtonVisible: canClearSelection,
              onTodayButtonTap: () {
                setState(() => _focusedDay.value = DateTime.now());
              },
              onClearButtonTap: () {
                setState(() {
                  _rangeStart = null;
                  _rangeEnd = null;
                  _selectedDays.clear();
                  _selectedAppointments.value = [];
                });
              },
              onLeftArrowTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              onRightArrowTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
            );
          },
        ),
        TableCalendar<MyAppointments>(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay.value,
          headerVisible: false,
          selectedDayPredicate: (day) => _selectedDays.contains(day),
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          calendarFormat: _calendarFormat,
          rangeSelectionMode: _rangeSelectionMode,
          eventLoader: _getAppointmentsForDay,
          onDaySelected: _onDaySelected,
          onRangeSelected: _onRangeSelected,
          onCalendarCreated: (controller) => _pageController = controller,
          onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() => _calendarFormat = format);
            }
          },
        ),
        const SizedBox(height: 8.0),
        ValueListenableBuilder<List<MyAppointments>>(
          valueListenable: _selectedAppointments,
          builder: (context, value, _) {
            return Column(
              children: [
                for (var myAppointments in value) buildTiles(myAppointments)
              ],
            );
          },
        ),
      ],
    ));
  }

  Widget buildTiles(MyAppointments myAppointments) {
    var imagelocation = "images/fitness_app/runner.png";
    if (myAppointments.appointmentType == AppointmentType.PersonalTraining)
      imagelocation = "images/fitness_app/personaltraining.png";
    else if (myAppointments.appointmentType == AppointmentType.Yoga)
      imagelocation = "images/fitness_app/yoga.png";

    return RunningView(
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval((1 / 3) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
        heading:
            "${myAppointments.title} - ${myAppointments.appointmentType.name}",
        titleText: "You're doing great! ",
        subtitleText:
            DateFormat('dd-MM-yyyy – kk:mm').format(myAppointments.eventDate),
        imagelocation: imagelocation);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FintnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            AppBarUi(
                animationController: widget.animationController!,
                topBarOpacity: topBarOpacity),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return ListView.builder(
      shrinkWrap: true,
      controller: scrollController,
      padding: EdgeInsets.only(
        top: AppBar().preferredSize.height +
            MediaQuery.of(context).padding.top +
            24,
        bottom: 62 + MediaQuery.of(context).padding.bottom,
      ),
      itemCount: listViews.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        widget.animationController!.forward();
        return listViews[index];
      },
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          SizedBox(
            width: 120.0,
            child: Text(
              headerText,
              style: TextStyle(fontSize: 26.0),
            ),
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, size: 20.0),
            visualDensity: VisualDensity.compact,
            onPressed: onTodayButtonTap,
          ),
          if (clearButtonVisible)
            IconButton(
              icon: Icon(Icons.clear, size: 20.0),
              visualDensity: VisualDensity.compact,
              onPressed: onClearButtonTap,
            ),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: onLeftArrowTap,
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
}
