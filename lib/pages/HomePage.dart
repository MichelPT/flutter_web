import 'package:flutter/material.dart';
import 'package:flutter_web/subpages/partner_page.dart';
import 'package:flutter_web/subpages/pet_page.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../subpages/home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'HOME'),
    Tab(text: 'PET'),
    Tab(
      text: 'PARTNER',
    )
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pawrent'),
        bottom: TabBar(
          padding: EdgeInsets.only(right: 40.w),
          controller: _tabController,
          tabs: myTabs,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.snackbar(
                'Informasi Akun', 'Berisi informasi mengenai akun anda'),
            icon: Icon(Icons.account_circle),
            iconSize: 7.h,
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((e) {
          final String label = e.text!.toLowerCase();
          return Center(
              child: label == 'home'
                  ? HomeSubPage()
                  : label == 'pet'
                      ? PetSubPage()
                      : PartnerSubPage());
        }).toList(),
      ),
    );
  }
}
