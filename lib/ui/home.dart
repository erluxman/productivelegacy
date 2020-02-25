import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Productive",
        ),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: BottomAppbarRow(),
        notchMargin: 8.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BottomAppbarRow extends StatefulWidget {
  @override
  _BottomAppbarRowState createState() => _BottomAppbarRowState();
}

class _BottomAppbarRowState extends State<BottomAppbarRow> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AppbarMenu(
          text: "Home",
          icon: Icons.home,
          isActive: currentIndex == 0,
          callBack: () {
            setState(() {
              currentIndex = 0;
            });
          },
        ),
        AppbarMenu(
          text: "Stats",
          icon: Icons.pie_chart,
          isActive: currentIndex == 1,
          callBack: () {
            setState(() {
              currentIndex = 1;
            });
          },
        ),
        Container(
          height: 0,
          width: 32,
        ),
        AppbarMenu(
          text: "Social",
          icon: Icons.people,
          isActive: currentIndex == 2,
          callBack: () {
            setState(() {
              currentIndex = 2;
            });
          },
        ),
        AppbarMenu(
          text: "More",
          icon: Icons.more_horiz,
          isActive: currentIndex == 3,
          callBack: () {
            setState(() {
              currentIndex = 3;
            });
          },
        ),
      ],
    );
  }
}

class AppbarMenu extends StatelessWidget {
  const AppbarMenu({
    this.text = "",
    this.icon,
    this.isActive,
    this.callBack,
  });

  final String text;
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
          Text(text),
        ],
      ),
    );
  }
}
