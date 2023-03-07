import 'package:flutter/material.dart';
import 'package:named_routes/providers/http_provider.dart';
import 'package:named_routes/screens/common_widgets/card.dart';
import 'package:provider/provider.dart';

import 'user_info.dart';

class MockData extends StatefulWidget {
  List<dynamic> usersInfo = [];
  MockData({super.key});

  @override
  State<MockData> createState() => _MockDataState();
}

class _MockDataState extends State<MockData> {
  @override
  void initState() {
    // print("bef");
    print("mount ${this.mounted}");
    super.initState();

    print('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var providerObj = Provider.of<HttpServiceProvider>(context, listen: false);
    providerObj.getRequest();
    print("prov obj ${providerObj}");
    print("c caled");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mock Data"),
      ),
      body: Consumer<HttpServiceProvider>(
        builder: (context, value, child) {
          var temp = value.dummyData;
          List<Widget> widgets = [];
          for (int i = 0; i < temp.length; i++) {
            widgets.add(Item(index: i, name: temp[i]["name"]));
          }
          return ListView(
            children: widgets,
          );
        },
      ),
    );
  }
}



// ListView.builder(
//           itemCount: widget.usersInfo.length,
//           itemBuilder: (context, index) {
//             return InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => UserInfo(
//                               index: index,
//                             )));
//               },
//               child: ListTile(
//                 leading: CircleAvatar(child: Text("${index + 1}")),
//                 title: Text("${widget.usersInfo[index]["name"]}"),
//               ),
//             );
//           })