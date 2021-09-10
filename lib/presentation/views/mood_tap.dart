import 'package:flutter/material.dart';
import 'package:newuiproject/presentation/views/post_display_with_mood_color_feature.dart';

class MoodTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: new Size(100.0, 10.0),
                child: const TabBar(
                  labelColor: Color(0xff306AFF),
                  unselectedLabelColor: Color(0xff7A7878),
                  indicatorColor: Color(0xff306AFF),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Color(0xffC4C4C4)),
                  tabs: [
                    Tab(
                      child: Text("Posted"),
                    ),
                    Tab(
                      child: Text("Saved"),
                    ),
                    Tab(
                      child: Text("Comment"),
                    ),
                    Tab(
                      child: Text("Reacted"),
                    ),
                  ],
                ),
              )),
          body: TabBarView(
            children: [
              PostDisplayWithMoodColorFeature(),
              PostDisplayWithMoodColorFeature(),
              PostDisplayWithMoodColorFeature(),
              PostDisplayWithMoodColorFeature(),
            ],
          ),
        ),
      ),
    );
  }
}
