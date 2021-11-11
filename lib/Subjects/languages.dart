import 'package:flutter/material.dart';
import 'package:jitsist/HomeScreen/ClipPath.dart';

class languages extends StatelessWidget {
  const languages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 140),
        child: ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/Images/bg11.png'),
                  fit: BoxFit.cover),
              color: Color(0xff00007c),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text('Languages',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              // crossAxisSpacing: 20,
              // mainAxisSpacing: 40,
              children: [
                CategoryCard(
                  src: 'Assets/Images/chemf.png',
                  title: 'English',
                  // press: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => AddClasstime()));
                  // },
                ),
                CategoryCard(
                  src: 'Assets/Images/chemf.png',
                  title: 'Sinhala',
                  // press: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => GroupClassList()));
                  // },
                ),
                CategoryCard(
                  src: 'Assets/Images/chemf.png',
                  title: 'Tamil',
                  // press: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ViewTime()));
                  // },
                ),
                CategoryCard(
                  src: 'Assets/Images/chemf.png',
                  title: 'Chinese',
                  // press: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ComingSoon()));
                  // },
                ),
                CategoryCard(
                  src: 'Assets/Images/polif.png',
                  title: 'Japanese',
                  // press: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ComingSoon()));
                  // },
                ),
                CategoryCard(
                  src: 'Assets/Images/chemf.png',
                  title: 'French',
                  // press: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ComingSoon()));
                  // },
                ),
                CategoryCard(
                  src: 'Assets/Images/chemf.png',
                  title: 'Hindi',
                  // press: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ComingSoon()));
                  // },
                ),
                CategoryCard(
                  src: 'Assets/Images/chemf.png',
                  title: 'Spanish',
                  // press: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ComingSoon()));
                  // },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String src;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.src,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Spacer(),
                  CircleAvatar(
                    backgroundImage: AssetImage(src),
                    radius: 30,
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
