import 'package:flutter/material.dart';
import 'package:my_assignment3/Screen/schedule_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> scheduleImages = [
    'images/datebg.jpg',
    'images/beachbg.jpg',
  ];
  final List<String> scheduleTitles = [
  'My Activity',
  'For School',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildCart,
    );
  }

  get _buildCart {
    List<String> title = ['Your Daily Schedule', 'Your Note'];
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: title.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text(title[index]),
              title[index] == 'Your Note'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title[index],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        //SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                              child: Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  : Text(
                      title[index],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
              //SizedBox(height: 10),

              index == 0 ?
                  SingleChildScrollView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          2,
                          (index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ScheduleScreen()));
                            },
                            child: Container(
                            height: 230,
                            width: 190,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(color: Colors.green.shade300, blurRadius: 10),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // Image background
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    scheduleImages[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),

                                // Text overlay
                                Positioned(
                                  top: 16,
                                  left: 16,
                                  child: Text(
                                    scheduleTitles[index], // 👈 Displaying 'My Activity' or 'For School'
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black45,
                                          offset: Offset(1, 1),
                                          blurRadius: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                            //child: Text('This is your note content.'),

                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: List.generate(
                          title[index] == 'Top related' ? 2 : 1,
                          (index) => Container(
                            height: 250,
                            width: 450,
                            margin: EdgeInsets.only(bottom: 20, right: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/note.avif'),
                                  fit: BoxFit.cover,
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.green.shade300,
                                      blurRadius: 10)
                                ],
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'This is your note content.',
                                style: TextStyle(
                                  fontFamily: 'Tagesschrift',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            //child: Text('This is your note content.'),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
