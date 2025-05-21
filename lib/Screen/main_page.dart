import 'package:flutter/material.dart';
import 'package:my_assignment3/Screen/home_page.dart';
import 'package:my_assignment3/Screen/schedule_details.dart';
//import 'package:my_assignment3/Screen/schedule_details.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        backgroundColor: const Color.fromARGB(255, 34, 162, 132),       
        leading: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.purple.shade400], // Your gradient colors
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          child: Text(
            'Schedule',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Tagesschrift',
              color: Colors.white, // Required for ShaderMask
            ),
          ),
        ),
      ),
        actions: [Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 30,
              height: 30,           
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              
            ),
          IconButton(onPressed: (){}, icon: Icon(Icons.person))
          ],
        ),
        ], 
      ),
      bottomNavigationBar: _buildButtonNavigationBar,
      body: _page[_selectItem],
    );
  }
  int _selectItem= 0;
  List<Widget> _page = <Widget>[
    HomePage(),
    DropUpListScreen(),
    Container(
      child: Center(
        child: Text('Menu'),
      ),
    ),
  ];



  get _buildButtonNavigationBar {
    return BottomNavigationBar(showSelectedLabels: false,
    showUnselectedLabels: false,
    iconSize: 25,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label:''),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label:''),
      BottomNavigationBarItem(icon: Icon(Icons.menu), label:''),
    ],
    onTap: _onItemTapped,
        currentIndex: _selectItem,
        selectedItemColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 34, 162, 132),
        type: BottomNavigationBarType.fixed,
    );
  }
    void _onItemTapped(int index){
      setState(() {
        _selectItem = index;
      });
    }
  }
