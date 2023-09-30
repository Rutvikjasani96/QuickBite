import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../variables_pro.dart';

Widget App_Bar({required VoidCallback onTapCart}) {
  return Column(
    children: [
      SizedBox(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PullDownButton(
            itemBuilder: (context) => [
              PullDownMenuItem(
                title: 'Contact Us',
                subtitle: 'Chat via Whatsapp',
                icon: CupertinoIcons.chat_bubble,
                onTap: () {
                  Future<void> _launchInBrowser(Uri url) async {
                    if (await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    )) {}
                  }

                  if (Uri.parse(
                          "https://wa.me/+917984507354?text=Hello QuickBite...")
                      .isAbsolute) {
                    _launchInBrowser(Uri.parse(
                        "https://wa.me/+917984507354?text=Hello QuickBite..."));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("ivalid link"),
                      backgroundColor: Colors.red,
                      duration: Duration(microseconds: 1500),
                    ));
                  }
                },
              ),
              const PullDownMenuDivider(),
              PullDownMenuItem(
                title: 'Follow on Instagram',
                icon: CupertinoIcons.heart,
                onTap: () {
                  Future<void> _launchInBrowser(Uri url) async {
                    if (await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    )) {}
                  }

                  if (Uri.parse("https://www.instagram.com/_rutavik._/")
                      .isAbsolute) {
                    _launchInBrowser(
                        Uri.parse("https://www.instagram.com/_rutavik._/"));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("ivalid link"),
                      backgroundColor: Colors.red,
                      duration: Duration(microseconds: 1500),
                    ));
                  }
                },
              ),
              const PullDownMenuDivider(),
              PullDownMenuItem(
                title: 'Follow on LinkedIn',
                icon: CupertinoIcons.app_badge,
                onTap: () {
                  Future<void> _launchInBrowser(Uri url) async {
                    if (await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    )) {}
                  }

                  if (Uri.parse(
                          "https://www.linkedin.com/in/rutvik-jasani-b30462202/")
                      .isAbsolute) {
                    _launchInBrowser(Uri.parse(
                        "https://www.linkedin.com/in/rutvik-jasani-b30462202/"));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("ivalid link"),
                      backgroundColor: Colors.red,
                      duration: Duration(microseconds: 1500),
                    ));
                  }
                },
              ),
              const PullDownMenuDivider(),
              PullDownMenuItem(
                title: 'Privacy Policy',
                icon: CupertinoIcons.exclamationmark_shield,
                onTap: () {
                  Future<void> _launchInBrowser(Uri url) async {
                    if (await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    )) {}
                  }

                  if (Uri.parse(
                          "https://privacypolicyfor99footballlivescore.blogspot.com/2023/09/privacy-policy-for-quick-bite-food.html")
                      .isAbsolute) {
                    _launchInBrowser(Uri.parse(
                        "https://privacypolicyfor99footballlivescore.blogspot.com/2023/09/privacy-policy-for-quick-bite-food.html"));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("ivalid link"),
                      backgroundColor: Colors.red,
                      duration: Duration(microseconds: 1500),
                    ));
                  }
                },
              ),
              const PullDownMenuDivider(),
              PullDownMenuItem(
                title: 'Rutvik Jasani',
                subtitle: 'Author',
                icon: CupertinoIcons.wand_stars_inverse,
                onTap: () {},
              ),
            ],
            buttonBuilder: (context, showMenu) => CupertinoButton(
              onPressed: showMenu,
              padding: EdgeInsets.zero,
              child: Container(
                height: 35,
                margin: EdgeInsets.only(left: 15),
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: Offset(
                        3,
                        3,
                      ),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icons/menu.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Quick Bite",
            style: TextStyle(
                fontSize: 18, fontFamily: font, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: onTapCart,
            child: Container(
              height: 37,
              // width: 35,
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(
                      3,
                      3,
                    ),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset("assets/icons/cart.jpg"),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
