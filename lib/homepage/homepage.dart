import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodspacelogin/constants/colors.dart';
import 'package:goodspacelogin/homepage/bloc/homepage_bloc.dart';
import 'package:goodspacelogin/widgets/mytext.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Image.asset("assets/images/work.png"), label: "Work"),
    BottomNavigationBarItem(
        icon: Image.asset("assets/images/recruit.png"), label: "Recruit"),
    BottomNavigationBarItem(
        icon: Image.asset("assets/images/social.png"), label: "Social"),
    BottomNavigationBarItem(
        icon: Image.asset("assets/images/message.png"), label: "Message"),
    BottomNavigationBarItem(
        icon: Image.asset("assets/images/profileicon.png"), label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark, statusBarColor: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Stack(children: [
            CustomPaint(
              painter: CirclePainter(),
              size: const Size(50, 50),
            ),
            Positioned(
                top: 3.5,
                left: 4,
                child: Image.asset("assets/images/profile.png"))
          ]),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/diamond.png")),
            IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/notification.png")),
            IconButton(
                onPressed: () {}, icon: Image.asset("assets/images/menu.png")),
            SizedBox(
              width: width * 0.03,
            ),
          ],
        ),
        body: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            return state is LoadingState
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: themeColor,
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/gold_diamond.png"),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                MyText(
                                  text: "Step into the future",
                                  fontSize: 14,
                                  color: textColor1,
                                  fontWeight: FontWeight.w600,
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            SizedBox(
                              height: height * 0.15,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.productNameData.data!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Container(
                                        height: height * 0.15,
                                        width: width * 0.4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                width: 1, color: themeColor)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundImage: AssetImage(
                                                  recruiterList[index]["url"]!),
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            MyText(
                                              text: state.productNameData
                                                  .data![index].displayName!,
                                              fontSize: 10,
                                              color: textColor1,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            MyText(
                                              text: state.productNameData
                                                  .data![index].productName!,
                                              fontSize: 12,
                                              color: themeColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: height * 0.035,
                            ),
                            MyText(
                              text: "Jobs for you",
                              fontSize: 14,
                              color: themeColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: themeColor,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                  color: textFieldBackground,
                                  border: Border.all(color: borderColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Image.asset("assets/images/search.png"),
                                  ),
                                  SizedBox(
                                    width: width * 0.8,
                                    child: TextField(
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: textColor1,
                                      ),
                                      controller: _textEditingController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        border: InputBorder.none,
                                        hintText: "Search Jobs",
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: secondaryOnbardingColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                                itemCount: state.jobsData.data!.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Container(
                                      height: height * 0.25,
                                      width: width,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: borderColor),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }))
                          ],
                        ),
                      ),
                    ],
                  );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: textFieldBackground,
          fixedColor: themeColor,
          items: items,
        ),
      ),
    );
  }

  final recruiterList = const [
    {
      "url": "assets/images/kimaya.png",
      "name": "Kimaya",
      "speciality": "AI Career Counsellor"
    },
    {
      "url": "assets/images/andrew.png",
      "name": "Andrew",
      "speciality": "Skill Trainer"
    },
    {
      "url": "assets/images/ajay.png",
      "name": "Ajay",
      "speciality": "Mock Interview"
    },
    {
      "url": "assets/images/sakshi.png",
      "name": "Sakshi",
      "speciality": "Skill gap Analysis"
    },
    {
      "url": "assets/images/profileboost.png",
      "name": "Anita",
      "speciality": "Life Coach"
    },
    {
      "url": "assets/images/arnold.png",
      "name": "Anita",
      "speciality": "Life Coach"
    },
    {
      "url": "assets/images/anita.png",
      "name": "Anita",
      "speciality": "Life Coach"
    },
  ];
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint()
      ..color = Colors.green
      ..strokeWidth = 2;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
