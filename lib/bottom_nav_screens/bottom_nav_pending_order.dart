import 'package:flutter/material.dart';
import 'package:partner_flutter_app/barcode_scan/widgets/product_search.dart';
import 'package:partner_flutter_app/screens/partner_process_update.dart';
import 'package:partner_flutter_app/screens/rfq_partner_update_screen.dart';
import 'package:partner_flutter_app/state/process_state.dart';
import 'package:partner_flutter_app/widgets/add_drower.dart';
import 'package:provider/provider.dart';

class BNPendingOrderProcessScreen extends StatelessWidget {
  static const routeName = '/pending-order-process-screen';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProcessState>(context).pendingorderprocess;
    //final process = Provider.of<OrderProcessState>(context).process;
    print('dashboard process data');
    print(data);
    return Scaffold(
      drawer: AppDrower(),
      body: Padding(
        padding: EdgeInsets.all(1),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProcessUpdateScreen.routeName,
                    arguments: data[i].id,
                  );
                },
                title: Text(data[i].processId),
                subtitle: Text(data[i].processName),
              ),
            );
          },
        ),
      ),
    );
  }
}
