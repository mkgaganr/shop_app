import 'package:flutter/material.dart';

import 'package:partner_flutter_app/barcode_scan/widgets/product_search.dart';
import 'package:partner_flutter_app/screens/partner_process_update.dart';
import 'package:partner_flutter_app/screens/partner_process_details.dart';
import 'package:partner_flutter_app/state/process_state.dart';
import 'package:partner_flutter_app/widgets/add_drower.dart';
import 'package:provider/provider.dart';

class PartnerDashboard extends StatelessWidget {
  static const routeName = '/partner-dashboard';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProcessState>(context).orderprocesslist;
    //final process = Provider.of<OrderProcessState>(context).process;
    print('dashboard process data');
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text("Partner Dashboard"),
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
                /*trailing: RaisedButton(
                  child: Text('Update'),
                  color: Colors.lightBlue,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      ProcessUpdateScreen.routeName,
                      arguments: data[i].id,
                    );
                  },
                ),
                */
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProcessDetailsScreens.routeName,
                    arguments: data[i].id,
                  );
                },
                title: Text(data[i].processName),
                subtitle: Text(data[i].processId),
              ),
            );
          },
        ),
      ),
    );
  }
}
