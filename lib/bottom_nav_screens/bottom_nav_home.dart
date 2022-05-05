import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:partner_flutter_app/screens/griddashboard.dart';
import 'package:partner_flutter_app/state/partner_details_state.dart';
import 'package:partner_flutter_app/state/process_state.dart';
import 'package:partner_flutter_app/state/rfq_partner_price_state.dart';
import 'package:partner_flutter_app/widgets/add_drower.dart';
import 'package:provider/provider.dart';
import 'package:bmnav/bmnav.dart' as bmnav;

class BNdashboard extends StatefulWidget {
  static const routeName = '/home-screens';

  @override
  _BNdashboardState createState() => _BNdashboardState();
}

class _BNdashboardState extends State<BNdashboard> {
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);

    final companyname =
        Provider.of<GetPartnerDetails>(context).getcompanyname();
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
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
                      "$companyname Workshop",
                      style: GoogleFonts.monda(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Date:${date.day}-${date.month}-${date.year}",
                      style: GoogleFonts.monda(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
