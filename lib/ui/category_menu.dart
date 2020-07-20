import 'package:finder/ui/griddashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryMenu extends StatefulWidget {
  CategoryMenu({Key key}) : super(key: key);

  @override
  _CategoryMenuState createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE1DFEA),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Kəşf et",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Seçimini doğru et",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  //alignment: Alignment.topCenter,
                  icon: Icon(
                    Icons.perm_device_information,
                    size: 20,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GridDashboard(),
        ],
      ),
    );
  }
}
