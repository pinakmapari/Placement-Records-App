import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:placement_records/auth/login.dart';
import 'package:placement_records/screens/admin/company.dart';
import 'package:placement_records/screens/admin/student.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  late int _selectedIndex;

  late List<String> _tabNames;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabNames = ['Company', 'Student'];
    _tabs = [CompanyPage(), StudentPage()];
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(_tabNames[_selectedIndex]),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (Route<dynamic> route) => false);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        selectedIndex: _selectedIndex,
        onItemSelected: (clickedIndex) async {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        animationDuration: Duration(milliseconds: 500),
        curve: Curves.easeInCirc,
        items: [
          BottomNavyBarItem(
            title: Text('Company'),
            icon: Icon(Icons.circle_rounded),
            textAlign: TextAlign.center,
            activeColor: Colors.blue[400]!,
            inactiveColor: Colors.black54,
          ),
          BottomNavyBarItem(
            title: Text('Student'),
            icon: Icon(Icons.person),
            textAlign: TextAlign.center,
            activeColor: Colors.blue[400]!,
            inactiveColor: Colors.black54,
          ),
        ],
      ),
    );
  }
}
