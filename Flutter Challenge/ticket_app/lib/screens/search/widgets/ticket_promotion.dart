import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class TicketPromotion extends StatelessWidget {
  const TicketPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * .42,
          height: 405,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 1,
                  spreadRadius: 2,
                )
              ]),
          child: Column(
            children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppMedia.planeSit))),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "20% discount on the early booking of this flight. Don't miss",
                style: AppStyles.headLineStyle2,
              )
            ],
          ),
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: size.width * .44,
                  height: size.height * .24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff3ab8b8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discount \nfor survey",
                        style: AppStyles.headLineStyle3.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Take the survey\nabout our \nservices and get \ndiscount",
                        style: AppStyles.headLineStyle3.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -45,
                  top: -40,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 18, color: AppStyles.circleColor),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffec6545)),
              width: size.width * .44,
              height: size.height * .24,
              child: Column(
                children: [
                  Text(
                    "Take Love",
                    style:
                        AppStyles.headLineStyle2.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      text: "😍",
                      style: TextStyle(fontSize: 30),
                    ),
                    TextSpan(
                      text: "🥰",
                      style: TextStyle(fontSize: 50),
                    ),
                    TextSpan(
                      text: "😘",
                      style: TextStyle(fontSize: 30),
                    ),
                  ]))
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
