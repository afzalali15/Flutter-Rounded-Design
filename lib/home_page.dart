import 'package:flutter/material.dart';
import 'package:rounded_design_demo/constants.dart';
import 'package:rounded_design_demo/recent_search_model.dart';
import 'package:rounded_design_demo/recommended_job_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<RecommendedJobModel> recommendedJobs = [
    RecommendedJobModel('Flutter Mobile Developer', 'CodeX, UAE',
        'assets/flutter_logo.png', lightGreenColor),
    RecommendedJobModel('Adobe XD Designer', 'CodeX, UAE', 'assets/xd_logo.png',
        lightPurpleColor),
    RecommendedJobModel('Mobile Developer', 'CodeX, UAE',
        'assets/flutter_logo.png', lightYellowColor),
  ];

  final List<RecentSearchInfo> recentSearcheTerms = [
    RecentSearchInfo('Flutter, USA', lightYellowColor),
    RecentSearchInfo('Flutter Developer, India', lightPurpleColor),
    RecentSearchInfo('Adobe XD, UAE', lightGreenColor),
    RecentSearchInfo('UX Designer, UK', lightYellowColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/hamburger_menu.png'),
                    onPressed: () {},
                  ),
                  Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/notification_icon.png'),
                        onPressed: () {},
                      ),
                      Positioned(
                        right: 8,
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Jobs\nDashboard",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                            color: Color(0xff000000),
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: LinearProgressIndicator(
                            value: 0.6,
                            backgroundColor: secondaryColor,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(primaryColor),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Profile Completeness",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff8d8d8d),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                        image: Image.asset('assets/profile_picture.png').image,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 32),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: primaryColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildInfo('17', 'Matching\nJobs'),
                  Container(width: 1, height: 50, color: secondaryColor),
                  buildInfo('20', 'Employer\nActions'),
                  Container(width: 1, height: 50, color: secondaryColor),
                  buildInfo('26', 'Search\nAppearances'),
                ],
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Based on your Profile",
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xff000000),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 150,
              padding: EdgeInsets.only(left: 24),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedJobs.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          width: 140,
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: recommendedJobs[index].backgroundColor,
                              borderRadius: BorderRadius.circular(24)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 16),
                              new Text(
                                recommendedJobs[index].jobTitle,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff434343),
                                ),
                              ),
                              SizedBox(height: 8),
                              new Text(
                                recommendedJobs[index].jobLocation,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff818181),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Image.asset(recommendedJobs[index]
                                    .companyImageSource))),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: new Text(
                "Recent Searches",
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Wrap(
                children: List.generate(recentSearcheTerms.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Chip(
                      label: Text(recentSearcheTerms[index].title),
                      padding: EdgeInsets.all(4),
                      backgroundColor:
                          recentSearcheTerms[index].backgroundColor,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 24,
                child: IconButton(
                  icon:
                      Image.asset('assets/home_icon.png', color: Colors.white),
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: Image.asset('assets/profile_icon.png'),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('assets/search_icon.png'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildInfo(String value, String description) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            value,
            style: TextStyle(
              fontFamily: "Avenir",
              fontWeight: FontWeight.w900,
              fontSize: 28,
              color: Color(0xffffffff),
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Avenir",
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xffffffff),
            ),
          ),
        ],
      ),
    );
  }
}
