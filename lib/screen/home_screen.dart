import 'package:covid19_app/constants.dart';
import 'package:covid19_app/screen/detail_screen.dart';
import 'package:covid19_app/widgets/InfoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
              bottom: 40,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Wrap(
              runSpacing: 20,
              spacing: 10,
              children: [
                InfoCard(
                  title: "Confirmed Cases",
                  iconColor: Color(0xffff8c00),
                  effectedNum: 1062,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen();
                    }));
                  },
                ),
                InfoCard(
                  title: "Total Deaths",
                  iconColor: Color(0xFFFF2D55),
                  effectedNum: 75,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen();
                    }));
                  },
                ),
                InfoCard(
                  title: "Total Recovered",
                  iconColor: Color(0xFF50E3C2),
                  effectedNum: 689,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen();
                    }));
                  },
                ),
                InfoCard(
                  title: "New Cases",
                  iconColor: Color(0xFF5856D6),
                  effectedNum: 52,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen();
                    }));
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preventions',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildPreventation(),
                  SizedBox(
                    height: 40,
                  ),
                  buildHelpCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildPreventation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreventionCard(
          svgSrc: 'assets/icons/hand_wash.svg',
          title: "Washing Hands",
        ),
        PreventionCard(
          svgSrc: 'assets/icons/use_mask.svg',
          title: "Use Masks",
        ),
        PreventionCard(
          svgSrc: 'assets/icons/Clean_Disinfect.svg',
          title: "Clean Disinfect",
        ),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: MediaQuery.of(context).size.width * 0.4,
            ),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF60BE93),
                  Color(0xFF1B8D59),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Dial 999 for \nMedical Help!\n",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  TextSpan(
                      text: "If any symptoms appear",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SvgPicture.asset('assets/icons/nurse.svg'),
          ),
          Positioned(
              right: 10,
              top: 30,
              child: SvgPicture.asset("assets/icons/virus.svg"))
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor.withOpacity(0.03),
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        ),
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventionCard({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: kPrimaryColor,
              ),
        )
      ],
    );
  }
}
