import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/http_provider.dart';

class UserInfo extends StatelessWidget {
  final int? index;
  const UserInfo({super.key, this.index});
  @override
  Widget build(BuildContext context) {
    dynamic index = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("user ${index! + 1} details"),
        ),
        body: Consumer<HttpServiceProvider>(
          builder: (context, object, child) {
            var particularUser = object.dummyData[index! == -1 ? 0 : index!];
            return Center(
              child: Container(
                height: 200,
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: Column(
                  children: [
                    Text("id : ${particularUser["id"]}"),
                    Text("Name : ${particularUser["name"]}"),
                    Text("createdAt : ${particularUser["createdAt"]}"),
                    Image.network(particularUser["avatar"])
                  ],
                ),
              ),
            );
          },
        ));
  }
}
