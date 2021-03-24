import 'dart:math';
import 'package:clock_app/world_clock/bloc/world_clock_bloc.dart';
import 'package:clock_app/world_clock/view/theme.dart';
import 'package:clock_app/world_clock/world_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: Scaffold(
        body: SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return Container(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocProvider(
                    create: (context) => WorldClockBloc(const WorldClock()),
                    child: Column(
                      children: [
                        const _TopSettingsRow(),
                        const _DigitalClock(),
                        const _AnalogClock(),
                        const _CitiesList(),
                        const _BottomTabBar(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _DigitalClock extends StatelessWidget {
  const _DigitalClock({
    Key? key,
  }) : super(key: key);

  String _formattedDateTime(DateTime dt) {
    final String _hour;

    if (dt.hour == 0)
      _hour = '12';
    else
      _hour = dt.hour > 12 ? '${dt.hour % 12}' : dt.hour.toString();

    final _minute = dt.minute < 10 ? '0${dt.minute}' : dt.minute.toString();

    return '$_hour:$_minute';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorldClockBloc, WorldClockState>(
      builder: (context, state) {
        final dateTime = state.dateTime;

        return Column(
          children: [
            const Text('Newport Beach, USA | PST'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _formattedDateTime(dateTime),
                  style: Theme.of(context).textTheme.headline1,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    dateTime.hour < 12 ? 'AM' : 'PM',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class _TopSettingsRow extends StatelessWidget {
  const _TopSettingsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.tune_sharp),
        Icon(
          Icons.add_circle,
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}

class _AnalogClock extends StatelessWidget {
  const _AnalogClock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).canvasColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Color(0x09000000),
              offset: Offset(0, 30),
              blurRadius: 10,
              spreadRadius: -10,
            )
          ],
        ),
        child: BlocBuilder<WorldClockBloc, WorldClockState>(
          builder: (context, state) {
            return CustomPaint(
              painter: _AnalogClockPainter(context, state.dateTime),
            );
          },
        ),
      ),
    );
  }
}

class _AnalogClockPainter extends CustomPainter {
  _AnalogClockPainter(this.context, this.dateTime);
  final BuildContext context;
  final DateTime dateTime;

  @override
  void paint(Canvas canvas, Size size) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final center = Offset(size.width / 2, size.height / 2);
    final secondHandLength = 117.0;
    final minuteHandLength = 110.0;
    final hourHandLength = 80.0;

    final secondHandPaint = Paint()
      ..strokeWidth = 2
      ..color = brightness == Brightness.light
          ? Themes.kLightThemeSecondHandColor
          : Themes.kDarkThemeSecondHandColor;

    final minuteHandPaint = Paint()
      ..strokeWidth = 10
      ..color = brightness == Brightness.light
          ? Themes.kLightThemeMinuteHandColor
          : Themes.kDarkThemeMinuteHandColor;

    final hourHandPaint = Paint()
      ..strokeWidth = 10
      ..color = brightness == Brightness.light
          ? Themes.kLightThemeHourHandColor
          : Themes.kDarkThemeHourHandColor;

    final innerCirclePaint = Paint()
      ..color = brightness == Brightness.light
          ? Themes.kLightThemeInnerCircleColor
          : Themes.kDarkThemeInnerCircleColor;

    final outerCirclePaint = Paint()
      ..color = brightness == Brightness.light
          ? Themes.kLightThemeOuterCircleColor
          : Themes.kDarkThemeOuterCircleColor;

    canvas
      ..drawLine(
          center,
          Offset(center.dx + secondHandLength * cos(secondHandAngle - (pi / 2)),
              center.dy + secondHandLength * sin(secondHandAngle - (pi / 2))),
          secondHandPaint)
      ..drawLine(
          center,
          Offset(center.dx + minuteHandLength * cos(minuteHandAngle - (pi / 2)),
              center.dy + minuteHandLength * sin(minuteHandAngle - (pi / 2))),
          minuteHandPaint)
      ..drawLine(
          center,
          Offset(center.dx + hourHandLength * cos(hourHandAngle - (pi / 2)),
              center.dy + hourHandLength * sin(hourHandAngle - (pi / 2))),
          hourHandPaint)
      ..drawCircle(center, 12, outerCirclePaint)
      ..drawCircle(center, 5, innerCirclePaint)
      ..drawCircle(
          center,
          12,
          innerCirclePaint
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  double get secondHandAngle => dateTime.second * pi / 30;

  double get minuteHandAngle =>
      (dateTime.minute * pi / 30) + (secondHandAngle / 60);

  double get hourHandAngle =>
      (dateTime.hour * pi / 6) +
      (dateTime.minute * pi / 360) +
      (dateTime.second * pi / (360 * 60));
}

class _CitiesList extends StatelessWidget {
  const _CitiesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, i) {
            return const Placeholder(
              fallbackHeight: 176,
              fallbackWidth: 233,
            );
          }),
    );
  }
}

class _BottomTabBar extends StatefulWidget {
  const _BottomTabBar({Key? key}) : super(key: key);

  @override
  __BottomTabBarState createState() => __BottomTabBarState();
}

class __BottomTabBarState extends State<_BottomTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Icon(Icons.alarm),
        Icon(Icons.watch),
        Icon(Icons.timer),
        Icon(Icons.watch),
      ],
    );
  }
}
