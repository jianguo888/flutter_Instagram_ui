/*
 * Copyright (c) 2024 坚果派
 * 微信公众号：nutpi
 * 官网：https://www.nutpi.net/
 *
 * 作者：NutPi
 * 创建日期：2022/03/22 16:50
 * 
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ig_ui_app/pages/home_page.dart';
import 'package:ig_ui_app/pages/search_page.dart';
import 'package:ig_ui_app/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: black,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    if (pageIndex == 0) {
      return const HomePage();
    } else if (pageIndex == 1) {
      return const SearchPage();
    } else if (pageIndex == 2) {
      return const Center(
          child: Text('Upload',
              style:
                  TextStyle(color: white, fontSize: 16, fontFamily: 'Roboto')));
    } else if (pageIndex == 3) {
      return const Center(
          child: Text('Activity',
              style:
                  TextStyle(color: white, fontSize: 16, fontFamily: 'Roboto')));
    } else {
      return const Center(
          child: Text('Account',
              style:
                  TextStyle(color: white, fontSize: 16, fontFamily: 'Roboto')));
    }
  }

  PreferredSizeWidget? getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/camera_icon.svg",
              width: 30,
            ),
            const Text(
              "Instagram",
              style: TextStyle(fontFamily: 'Billabong', fontSize: 35),
            ),
            SvgPicture.asset(
              "assets/images/message_icon.svg",
              width: 30,
            ),
          ],
        ),
      );
    } else if (pageIndex == 1) {
      return null;
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Upload", style: TextStyle(color: white, fontSize: 16, fontFamily: 'Roboto')),
      );
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Activity", style: TextStyle(color: white, fontSize: 16, fontFamily: 'Roboto')),
      );
    } else {
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Account", style: TextStyle(color: white, fontSize: 16, fontFamily: 'Roboto')),
      );
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: appFooterColor),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: SvgPicture.asset(
                  bottomItems[index],
                  width: 27,
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
