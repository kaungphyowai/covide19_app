import 'package:covid19_app/constants.dart';
import 'package:covid19_app/widgets/WeeklyChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 53,
                    color: Colors.black.withOpacity(0.05),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleWithMoreIcon(),
                  SizedBox(
                    height: 15,
                  ),
                  buildCaseNumber(context),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'From Health Center',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: kTextMediumColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  WeeklyChart(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildInfoTextPercentage(
                        percent: 6.43,
                        text: "From Last Week",
                      ),
                      buildInfoTextPercentage(
                        percent: 9.43,
                        text: "Recovery Rate  ",
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 54,
                    color: Colors.black.withOpacity(0.05),
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Global Map",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/more.svg")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset('assets/icons/map.svg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  RichText buildInfoTextPercentage({final String text, final double percent}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$percent% \n',
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
            ),
          ),
          TextSpan(
            text: '$text',
            style: TextStyle(
              height: 1.5,
              color: kTextMediumColor,
            ),
          )
        ],
      ),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: [
        Text(
          '547 ',
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text(
          '5.9%',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        SvgPicture.asset('assets/icons/increase.svg'),
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'New Cases',
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        SvgPicture.asset('assets/icons/more.svg')
      ],
    );
  }

  AppBar buildDetailAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        )
      ],
    );
  }
}
