import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int fabClickCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Productive",
        ),
      ),
      body: Center(
        child: Text(fabClickCount.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        onPressed: () {
          setState(() {
            fabClickCount += 1;
          });
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: BottomAppbarContainer(),
        notchMargin: 8.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BottomAppbarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<AppbarMenuData> appBarMenuData = [
      AppbarMenuData(title: "Home", icon: Icons.home, index: 0),
      AppbarMenuData(title: "Stats", icon: Icons.pie_chart, index: 1),
      AppbarMenuData(title: "Social", icon: Icons.people, index: 2),
      AppbarMenuData(title: "More", icon: Icons.home, index: 3),
    ];
    return BottomAppbarRow(appBarMenuData);
  }
}

class AppbarMenuData {
  const AppbarMenuData({this.title, this.icon, this.index});

  final String title;
  final IconData icon;
  final int index;
}

class BottomAppbarRow extends StatefulWidget {
  const BottomAppbarRow(this.data);

  final List<AppbarMenuData> data;

  @override
  _BottomAppbarRowState createState() => _BottomAppbarRowState();
}

class _BottomAppbarRowState extends State<BottomAppbarRow> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.data.map((AppbarMenuData data) {
        return AppbarMenu(
          title: data.title,
          icon: data.icon,
          isActive: data.index == currentIndex,
          callBack: () {
            setState(() {
              currentIndex = data.index;
            });
          },
        );
      }).toList(),
    );
  }
}

class AppbarMenu extends StatelessWidget {
  const AppbarMenu({
    this.title = "",
    this.icon,
    this.isActive,
    this.callBack,
  });

  final String title;
  final IconData icon;
  final bool isActive;
  final Function() callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Column(
        children: <Widget>[
          IconButton(
            onPressed: () {
              callBack();
            },
            icon: Icon(
              icon,
              color: isActive ? Colors.blue : Colors.black45,
              size: isActive ? 36 : 32,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.blue : Colors.black45,
              fontSize: isActive ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
