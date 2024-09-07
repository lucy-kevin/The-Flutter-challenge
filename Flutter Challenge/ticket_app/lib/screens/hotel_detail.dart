import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ticket_app/Controller/text_expansion_controller.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/app_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    index = args["index"];

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyles.primaryColor,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              //title: Text(
              //hotelList[index]["place"],
              //),
              background: Stack(children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/${hotelList[index]["image"]}",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.black.withOpacity(0.3),
                    child: Text(
                      hotelList[index]["place"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: AppStyles.primaryColor,
                              offset: const Offset(2.0, 2.0),
                            )
                          ]),
                    ),
                  ),
                )
              ]),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: ExpandedTextWidget(
                  text: hotelList[index]["detail"],
                )
                // child: Text(
                //     "The Onchain Foundation is dedicated to researching and analyzing existing Web3 use cases and uncovering their potential for you. \nIn addition, as a venture studio, we run innovative projects to facilitate seamless onchain activity in Web3 Blockchain is the foundation for Web3, a new, more reliable internet that has the power to transform the way we do business. \nIt addresses some of today's most pressing challenges. We work to make Web3 accessible to entrepreneurs, startups, and other businesses."),
                ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "More Images",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelList[index]["images"].length,
                  itemBuilder: (context, imagesIndex) {
                    return Container(
                        margin: EdgeInsets.all(16),
                        color: Colors.red,
                        child: Image.asset(
                            "assets/images/${hotelList[index]["images"][imagesIndex]}"));
                  }),
            )
          ]))
        ],
      ),
    );
  }
}

class ExpandedTextWidget extends StatelessWidget {
  ExpandedTextWidget({super.key, required this.text});
  final String text;

  final TextExpansionController controller = Get.put(TextExpansionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var textWidget = Text(
        text,
        maxLines: controller.isExpanded.value ? null : 5,
        overflow: controller.isExpanded.value
            ? TextOverflow.visible
            : TextOverflow.ellipsis,
      );
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        textWidget,
        GestureDetector(
          onTap: () {
            controller.toggleExpansion();
          },
          child: Text(controller.isExpanded.value ? "less" : "More",
              style:
                  AppStyles.textStyle.copyWith(color: AppStyles.primaryColor)),
        ),
      ]);
    });
  }
}
