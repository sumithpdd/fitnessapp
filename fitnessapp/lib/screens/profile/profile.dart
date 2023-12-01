import 'package:fitnessapp/helpers/color/constants.dart';
import 'package:fitnessapp/helpers/components/appbarbutton.dart';
import 'package:fitnessapp/helpers/components/custom_appbar.dart';
import 'package:fitnessapp/helpers/components/widget/bottom_button.dart';
import 'package:fitnessapp/helpers/config/size_config.dart';
import 'package:fitnessapp/models/note.dart';
import 'package:fitnessapp/repository/db/notes_database.dart';
import 'package:fitnessapp/screens/home/fitnessAppHomeScreen.dart';
import 'package:fitnessapp/screens/profile/card.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final int? noteId;

  const Profile({
    Key? key,
    this.noteId,
  }) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppBar(
          onpressed: () {
            print("pressed");
          },
          backgroundcolor: Colors.transparent,
          title: 'Profile',
          leading: AppBarButton(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : notes.isEmpty
                    ? Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(200),
                            ),
                            Text(
                              'No BMI Result Saved ',
                              style: TextStyle(
                                color: AppColor.unselectedTextColor,
                                fontSize: getProportionateScreenWidth(20),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(100),
                            ),
                            BottomButton(
                              buttonTitle: 'Calculate BMI',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(20),
                                color: AppColor.backgroundcolor,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FitnessAppHomeScreen(),
                                  ),
                                );
                              },
                              width: getProportionateScreenWidth(250),
                              colour: AppColor.buttonbackgroundcolor,
                              height: getProportionateScreenHeight(50),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(100),
                            ),
                            // Bannerad(),
                          ],
                        ),
                      )
                    : buildNotes(),
          ),
        ),
      );

  Widget buildNotes() => Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];

                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    color: AppColor.buttonbackgroundcolor,
                    child: Icon(
                      Icons.delete,
                      color: AppColor.backgroundcolor.withOpacity(0.7),
                      size: 35,
                    ),
                  ),
                  key: Key(notes[index].id.toString()),
                  onDismissed: (direction) {
                    final snackBar = SnackBar(content: Text('Deleted'));
                    NotesDatabase.instance.delete(notes[index].id!);
                    print("deleted");
                    refreshNotes();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: ListCard(
                    note: note,
                    index: index,
                    noteId: note.id!,
                    colour: AppColor.backgroundcolor,
                  ),
                );
              },
            ),
          ),
          // Bannerad(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
        ],
      );
}
