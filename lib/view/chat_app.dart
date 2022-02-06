import 'package:fchat/controller/navigation.dart';
import 'package:fchat/view/qr_code_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_widget.dart';
import 'contacts_widget.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> with SingleTickerProviderStateMixin {
  final List<Tab> appTabs = const <Tab>[
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
    Tab(icon: Icon(Icons.watch_outlined)),
    Tab(icon: Icon(Icons.architecture_rounded)),
  ];

  @override
  void initState() {
    super.initState();

    ControllerRegistry().tabController = TabController(vsync: this, length: appTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secret chat',
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Secret chat'),
            bottom: TabBar(
              controller: ControllerRegistry().tabController,
              tabs: appTabs,
            ),
          ),
          body: TabBarView(
            controller: ControllerRegistry().tabController,
            children: const <Widget>[
              ChatWidget(),
              ContactsWidget(),
              QrCodeWidget(),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
