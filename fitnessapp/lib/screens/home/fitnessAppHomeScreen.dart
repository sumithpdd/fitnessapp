import 'package:fitnessapp/models/user_data.dart';
import 'package:fitnessapp/myAppointments/myAppointmentsScreen.dart';
import 'package:fitnessapp/screens/home/bmi_dashboard.dart';
import 'package:fitnessapp/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../bottomNavigationView/bottomBarView.dart';
import '../../fintnessAppTheme.dart';
import '../../models/tabIconData.dart';
import '../../myDiary/myDiaryScreen.dart';
import '../../traning/trainingScreen.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FintnessAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FintnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    UserData userData = Provider.of<UserData>(context, listen: false);
    userData = await Provider.of<DatabaseService>(context, listen: false)
        .getUserMeasurements(userData.currentUserId);

    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (index) {
            if (index == 0) {
              animationController!.reverse().then((data) {
                if (!mounted) return;
                setState(() {
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController!.reverse().then((data) {
                if (!mounted) return;
                setState(() {
                  tabBody =
                      TrainingScreen(animationController: animationController!);
                });
              });
            } else if (index == 2) {
              animationController!.reverse().then((data) {
                if (!mounted) return;
                setState(() {
                  tabBody = MyAppointmentsScreen(
                      animationController: animationController!);
                });
              });
            } else if (index == 3) {
              animationController!.reverse().then((data) {
                if (!mounted) return;
                setState(() {
                  tabBody = BmiDashboard();
                });
              });
            }
          },
        ),
      ],
    );
  }
}
