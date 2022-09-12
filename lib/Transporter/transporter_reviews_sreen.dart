// ignore_for_file: file_names
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/controllers/transporter_rate_controller.dart';
import 'package:alnagel/models/rate_model.dart';
import 'package:alnagel/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TransporterReviewsScreen extends StatefulWidget {
  const TransporterReviewsScreen({Key? key}) : super(key: key);

  @override
  _TransporterReviewsScreenState createState() =>
      _TransporterReviewsScreenState();
}

class _TransporterReviewsScreenState extends State<TransporterReviewsScreen> {
  Future<void> _loadResources() async {
    //when we call Getx controller before GetMaterialApp they generally stay in the memory
    //but here we call them after
    String apiToken = Get.find<AppController>().getApiToken()!;
    Get.find<TransporterRateController>().getReviews({'token': apiToken});
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
  }

  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: hi,
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.teal,
                            )),
                        Text(
                          'الاعدادات'.tr,
                          style: const TextStyle(color: Colors.teal),
                        )
                      ],
                    ),
                  ],
                ),
                GetBuilder<TransporterRateController>(
                    builder: (rateController) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'التقييم'.tr,
                                  style: const TextStyle(
                                      color: Colors.teal, fontSize: 20),
                                ),
                                IconButton(
                                    onPressed: () {
                                      // Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.filter_list,
                                      color: Colors.teal,
                                      size: 25,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: hi - 300,
                        child: rateController.isLoaded
                            ? ListView.builder(
                                itemCount: rateController.reviewsList.length,
                                itemBuilder: ((context, index) {
                                  return reviewItem(
                                      rateController.reviewsList[index]);
                                }))
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xff00afa0),
                                ),
                              ),
                      )
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      )),

      // bottomNavigationBar: bottomnavbar(co)
    );
    // }));
  }

  Widget reviewItem(RateModel rateModel) {
    return Container(
      color: const Color.fromARGB(12, 0, 0, 0),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.black54,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    rateModel.comment,
                    style: const TextStyle(color: Colors.black54),
                  )
                ],
              ),
              RatingBar.builder(
                itemSize: 15,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                //  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.calendar_month_rounded,
                color: Colors.black54,
                size: 17,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                justDate(rateModel.createdAt),
                style: const TextStyle(color: Colors.black54, fontSize: 12),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                rateModel.comment,
                style: const TextStyle(color: Colors.black54, fontSize: 15),
                maxLines: 5,
              )
            ],
          ),
        ],
      ),
    );
  }
}
