import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner_flutter_app/screens/partner_completed_process.dart';
import 'package:partner_flutter_app/screens/partner_dashboard.dart';
import 'package:partner_flutter_app/screens/partner_pending_process.dart';
import 'package:partner_flutter_app/screens/register_screens.dart';
import 'package:partner_flutter_app/screens/rfq_partner_price.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "View Orders",
    subtitle: "March, Wednesday",
    event: "3 Events",
    img: "assets/calendar.png",
    url: PartnerDashboard.routeName,
  );

  Items item2 = new Items(
    title: "Upcoming Orders",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "assets/upcoming_order.png",
    url: PendingOrderProcessScreen.routeName,
  );
  Items item3 = new Items(
    title: "Past Orders",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "assets/past_order.png",
    url: CompletedOrderProcessScreen.routeName,
  );
  Items item4 = new Items(
    title: "Payments",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "assets/money.png",
    url: PartnerDashboard.routeName,
  );
  Items item5 = new Items(
    title: "RFQ",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "assets/todo.png",
    url: RfqPartner.routeName,
  );
  Items item6 = new Items(
    title: "Settings",
    subtitle: "",
    event: "2 Items",
    img: "assets/setting.png",
    url: RegisterScreens.routeName,
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(data.url);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(color),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.img,
                        width: 42,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.title,
                        style: GoogleFonts.monda(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.subtitle,
                        style: GoogleFonts.monda(
                            textStyle: TextStyle(
                                color: Colors.white38,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.event,
                        style: GoogleFonts.monda(
                            textStyle: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ));
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  final String url;
  Items({this.title, this.subtitle, this.event, this.img, this.url});
}
