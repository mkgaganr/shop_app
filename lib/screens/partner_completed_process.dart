import 'package:flutter/material.dart';
import 'package:partner_flutter_app/barcode_scan/widgets/product_search.dart';
import 'package:partner_flutter_app/screens/partner_process_details.dart';
import 'package:partner_flutter_app/screens/rfq_partner_update_screen.dart';
import 'package:partner_flutter_app/state/process_state.dart';
import 'package:partner_flutter_app/widgets/add_drower.dart';
import 'package:provider/provider.dart';

class CompletedOrderProcessScreen extends StatelessWidget {
  static const routeName = '/completed-order-process-screen';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProcessState>(context).completedorderprocess;
    String date = "22/02/2022";
    //final process = Provider.of<OrderProcessState>(context).process;
    print('dashboard process data');
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed Orders"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: ProductSearch());
            },
          ),
        ],
      ),
      drawer: AppDrower(),
      body: Padding(
        padding: EdgeInsets.all(1),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i) {
            return Card(
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.white24))),
                  child: Text(
                    data[i].processName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                    ),
                  ),
                ),
                title: Text(
                  data[i].processId,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 22,
                  ),
                ),
                //subtitle: Text(data[i].processName),
                subtitle: Row(
                  children: <Widget>[
/*                     Expanded(
                        flex: 1,
                        child: Container(
                          // tag: 'hero',
                          child: LinearProgressIndicator(
                              backgroundColor:
                                  Color.fromRGBO(209, 224, 224, 0.2),
                              value: 2,
                              valueColor: AlwaysStoppedAnimation(Colors.green)),
                        )),
 */
                    Expanded(
                      flex: 25,
                      child: Padding(
                          padding: EdgeInsets.only(left: 2.0),
                          child: Text("Due Date:$date",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ))),
                    ),
                    Expanded(
                      flex: 14,
                      child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(("Target Cost"),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ))),
                    )
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.black, size: 30.0),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProcessDetailsScreens.routeName,
                    arguments: data[i].id,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
