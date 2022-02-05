import 'package:flutter/material.dart';
import 'package:flutter_portfolio/styles/text_styles.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelPadding: const EdgeInsets.all(0.0),
            indicatorColor: Colors.grey,
            isScrollable: false,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: Styles.mainColor),
              //insets:  EdgeInsets.only(right: 15.0)
            ),
            tabs: [
              Tab(
                iconMargin: const EdgeInsets.all(0.0),
                child: Text(
                  "About",
                  style: Styles.title.copyWith(
                      color: Colors.black87,
                      fontSize: 18.0,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Tab(
                  iconMargin: const EdgeInsets.all(0.0),
                  child: Text(
                    "Career",
                    style: Styles.title.copyWith(
                        color: Colors.black87,
                        fontSize: 18.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  )),
              Tab(
                  iconMargin: const EdgeInsets.all(0.0),
                  child: Text(
                    "Contact",
                    style: Styles.title.copyWith(
                        color: Colors.black87,
                        fontSize: 18.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  )),
            ],
          ),
          const Flexible(
            flex: 1,
            child: TabBarView(
              children: [Text("Creer"), Text("About"), Text("Contact")],
            ),
          )
        ],
      ),
    );
  }
}
