import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:booking_app/calendar_page.dart';


const d_green= Color(0xFF54D3C2);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Reservations",
        home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: d_green,
        appBar: MyAppBar(),
        body: SingleChildScrollView(
            child: Column(
              children:[
                SearchSection(),
                HotelSection(),
              ],
            )
        )
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Colors.grey[800],
                size:20),
            onPressed: null),
        title: Text("Explore",
            style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w800)
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.favorite_outline_rounded,
                  color: Colors.grey[800],
                  size:20),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.place,
                  color: Colors.grey[800],
                  size:20),
              onPressed: null),
        ],
        centerTitle: true,
        backgroundColor : Colors.white
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
              children:[
                Expanded(
                    child:
                    Container(
                      padding: EdgeInsets.only(left:5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(blurRadius: 4,
                                color: Colors.grey.shade300,
                                offset: Offset(0,3))
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Paris",
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none
                        ),
                      ),
                    )
                ),
                SizedBox(width:10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 4,
                            color: Colors.grey.shade300,
                            offset: Offset(0,4))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CalendarPage();
                      }),
                      );
                    },
                    child: Icon(
                      Icons.search,
                      size: 26,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: d_green
                    ),
                  ),

                )
              ]
          ),
          //SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Choose date",
                        style: GoogleFonts.nunito(
                            fontSize: 15,
                            color: Colors.grey
                        ),
                    ),
                    Text("17 Dec - 27 Dec",
                        style: GoogleFonts.nunito(
                            fontSize: 17,
                            color: Colors.black
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Number of rooms",
                      style: GoogleFonts.nunito(
                          fontSize: 15,
                          color: Colors.grey
                      ),),
                    Text("1 room - 2 adults",
                        style: GoogleFonts.nunito(
                            fontSize: 17,
                            color: Colors.black
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HotelSection extends StatelessWidget {
  //const HotelSection({Key? key}) : super(key: key);
  final List Hotels =[
    {
      'title':'Hotel 1',
      'place': 'xxxxxx ,Paris',
      'distance':2,
      'review':36,
      'picture':'assets/images/image1.jpg',
      'price':'180'
    },
    {
      'title':'Hotel 2',
      'place': 'xxxxxx ,Paris',
      'distance':2,
      'review':64,
      'picture':'assets/images/image2.jpg',
      'price':'160'
    },
    {
      'title':'Hotel 3',
      'place': 'xxxxxx ,Paris',
      'distance':5,
      'review':12,
      'picture':'assets/images/image3.jpg',
      'price':'120'
    },
    {
      'title':'Hotel 4',
      'place': 'xxxxxx ,Paris',
      'distance':6,
      'review':56,
      'picture':'assets/images/image4.jpg',
      'price':'60'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 50,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("121 hotels founds",
                    style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.black
                    )),
                Row(
                  children: [
                    Text("Filters",
                        style: GoogleFonts.nunito(
                            fontSize: 15,
                            color: Colors.black
                        )),
                    Icon(
                      Icons.filter_list_outlined,
                      size: 26,
                      color: d_green,
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: Hotels.map((data) {
              return HotelData(data);
            }).toList(),
          )
        ],
      ),
    );
  }
}

class HotelData extends StatelessWidget {
  final Map hoteldata;
  HotelData(this.hoteldata);
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      height: 230,
      // child: Text(data['title'])
      //child: Image.asset(hoteldata['picture']),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
              spreadRadius: 4,
              blurRadius: 6,
              color: Colors.grey.shade200,
              offset: Offset(0,3))
        ],
      ),
      child: Column(
        children: [
          Container(
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)
                  ),
                  image: DecorationImage(
                      image: AssetImage(hoteldata['picture']),
                      fit: BoxFit.cover)

              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 5,
                      right: -15,
                      child: MaterialButton(
                        color: Colors.white,
                        onPressed: (){},
                        shape: CircleBorder(),
                        child: Icon(
                            Icons.favorite_outline_rounded,
                            color: d_green,
                            size:20
                        ),
                      ))
                ],
              )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hoteldata['title'],
                    style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w800
                    )),
                Text("\$" + hoteldata['price'],
                    style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w800
                    ))
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(hoteldata['place'],
                      style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400
                      )),
                  Row(
                    children: [
                      Icon(
                          Icons.place,
                          color: d_green,
                          size:14
                      ),
                      Text(hoteldata['distance'].toString()+ ' km to city',
                          style: GoogleFonts.nunito(
                              fontSize: 14,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w400
                          ))
                    ],
                  ),
                  Text('per night',
                      style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w400
                      ))
                ],
              )
          ),
          Container(
              margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate,
                        color: d_green,
                        size: 14,),
                      Icon(
                        Icons.star_rate,
                        color: d_green,
                        size: 14,),
                      Icon(
                        Icons.star_rate,
                        color: d_green,
                        size: 14,),
                      Icon(
                        Icons.star_rate,
                        color: d_green,
                        size: 14,),
                      Icon(
                        Icons.star_border,
                        color: d_green,
                        size: 14,)
                    ],
                  ),
                  SizedBox(width: 10,),
                  Text(hoteldata['review'].toString() +' reviews',
                      style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400
                      ))
                ],
              )
          )
        ],
      ),
    );
  }
}
