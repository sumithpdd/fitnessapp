import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.count(
        physics: ScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        children: <Widget>[
          myItem(Icons.graphic_eq,"Total views",Colors.deepPurple),
          myItem(Icons.bookmark,"Bookmark",Colors.yellow),
          myItem(Icons.notifications,"Notifications",Colors.deepOrange),
          myItem(Icons.attach_money,"Balance",Colors.indigoAccent),
          myItem(Icons.settings,"Settings",Colors.indigo),
          myItem(Icons.group_work,"Group work",Colors.teal),
          myItem(Icons.message,"Message",Colors.indigo),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 250.0),
          StaggeredTile.extent(2, 130.0),
        ],
      ),
    );
  }

  Material myItem(IconData icon,String title,Color color){
    return Material(
      color: Colors.white,
      elevation: 14,
      shadowColor: Colors.green[200],
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(padding: EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title,
                      style: TextStyle(
                        color: color,
                        fontSize: 20.0,
                      ),
                      ),
                    ),
                  ),
                  Material(
                    color: color,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(padding: EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
            )
          ],
        ),
        ),
      ),
    );
  }

}
