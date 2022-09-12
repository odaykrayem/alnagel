// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/models/user_offer_model.dart';
import 'package:alnagel/utils/date_formatter.dart';
import 'package:alnagel/utils/showToast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_offers_controller.dart';

class UserOfferDetails extends StatefulWidget {
  final UserOfferModel userOfferModel;

  const UserOfferDetails({
    Key? key,
    required this.userOfferModel,
  }) : super(key: key);

  @override
  State<UserOfferDetails> createState() => _UserNotiDetailsState();
}

class _UserNotiDetailsState extends State<UserOfferDetails> {
  String apiToken = Get.find<AppController>().getApiToken()!;

  final TextEditingController costController = TextEditingController();
  String? cost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'رجوع'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GetBuilder<UserOffersController>(builder: (controller) {
            return Column(
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.teal,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.userOfferModel.userName ?? 'userName^'),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'ARequestHasBeenSentFromTheDriver'.tr,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(widget.userOfferModel.cost,
                        style: const TextStyle(color: Colors.grey)),
                    const Icon(Icons.attach_money_rounded, color: Colors.grey),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(widget.userOfferModel.type ?? 'type^',
                        style: const TextStyle(color: Colors.grey)),
                    const Icon(
                      Icons.work_outline_rounded,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(getTime(widget.userOfferModel.createdAt),
                        style: const TextStyle(color: Colors.grey)),
                    const Icon(Icons.access_time, color: Colors.grey),
                  ]),
                ]),
                const SizedBox(
                  height: 15,
                ),
                controller.isLoaded
                    ? Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  showAcceptOfferDialog();
                                },
                                child: Text(
                                  'قبول'.tr,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ))),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  showCancelOfferDialog();
                                },
                                child: Text(
                                  'عروض أخرى'.tr,
                                  style: const TextStyle(color: Colors.red),
                                ),
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: const BorderSide(
                                          color: Colors.red, width: 1.5),
                                    ))),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff00afa0),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showSuggestNewCostDialog();
                          },
                          child: Text(
                            'اقتراح سعر اخر'.tr,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: const BorderSide(
                                    color: Colors.grey, width: 1.5),
                              ))),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 20),
                  child: Row(
                    children: [
                      Text(
                        ':تفاصيل طلبي'.tr,
                        style:
                            const TextStyle(color: Colors.teal, fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    width: double.infinity,
                    child: const Divider(
                      color: Colors.grey,
                    )),
                bottomItem(
                    'موقع الاستلام'.tr, 'location'.tr, Icons.location_on),
                bottomItem('موقع التسليم'.tr, 'location'.tr, Icons.location_on),
                notesItem('ملاحظات للسائق',
                    'mssbhfbshbflfdfsbdvfgsvdevvgfvgsdvvmssbhfbshbflfdfsbdvfgsvdevvgfvgsdvvmssbhfbshbflfdfsbdvfgsvdevvgfvgsdvv')
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget bottomItem(String title, String text, IconData icon) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 15, color: Colors.grey),
            const SizedBox(
              width: 10,
            ),
            Text(
              title + ':',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
      Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          width: double.infinity,
          child: const Divider(
            color: Colors.grey,
          )),
    ]);
  }

  Widget notesItem(String title, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title + ':',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            maxLines: 4,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  void showAcceptOfferDialog() {
    double height = MediaQuery.of(context).size.height;
    Get.defaultDialog(
        barrierDismissible: true,
        radius: 10,
        title: '',
        contentPadding: EdgeInsets.zero,
        content: Container(
          // height: height - 400,
          // width: width - 50,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Center(
                child: Text(
                  'عزيزي العميل',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'لا يمكنك الغاء الطلب \n او استبدال المندوب بعد 7 دقائق \n من الان',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w300, height: 2),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: (height - 400) / 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // debugPrint(
                          //   'token: $apiToken id : ${widget.userOfferModel.id}',
                          // );
                          debugPrint('acc offer : ${widget.userOfferModel.id}');
                          Get.find<UserOffersController>().acceptOffer({
                            'token': apiToken,
                            'id': '${widget.userOfferModel.id}',
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'موافق',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff00afa0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        color: Color(0xff00afa0))))),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'إلغاء',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff00afa0),
                          ),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        color: Color(0xff00afa0))))),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  void showCancelOfferDialog() {
    double height = MediaQuery.of(context).size.height;
    Get.defaultDialog(
        barrierDismissible: true,
        radius: 10,
        title: '',
        contentPadding: EdgeInsets.zero,
        content: Container(
          // height: height - 400,
          // width: width - 50,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Center(
                child: Text(
                  'عزيزي العميل',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'هل تريد بالتأكيد إلغاء الطلب',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w300, height: 2),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: (height - 400) / 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // debugPrint(
                          //   'token: $apiToken id : ${widget.userOfferModel.id}',
                          // );
                          debugPrint(
                              'cancel offer : ${widget.userOfferModel.id}');
                          Get.find<UserOffersController>().cancelOffer({
                            'token': apiToken,
                            'id': '${widget.userOfferModel.id}',
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'موافق',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff00afa0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        color: Color(0xff00afa0))))),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'إلغاء',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff00afa0),
                          ),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        color: Color(0xff00afa0))))),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  void showSuggestNewCostDialog() {
    double height = MediaQuery.of(context).size.height;
    Get.defaultDialog(
        barrierDismissible: true,
        radius: 10,
        title: '',
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        content: Container(
          // height: 200,
          // width: width - 50,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  'السعر المقترح'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  widget.userOfferModel.cost,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: Divider(
                  color: Colors.grey[300],
                  height: 1.5,
                ),
              ),
              Center(
                child: Text(
                  'تعديل السعر'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: TextFormField(
                        controller: costController,
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (val) {
                          cost = val;
                        },
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      'ريال'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: (height - 400) / 6,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // debugPrint(
                          //   'token: $apiToken id : ${widget.userOfferModel.id}',
                          // );
                          if (cost != null) {
                            debugPrint(
                                'change cost : ${widget.userOfferModel.orderId}');
                            debugPrint('change cost : ${cost}');
                            debugPrint('change cost : ${apiToken}');
                            Get.find<UserOffersController>().updateOrder({
                              'token': apiToken,
                              'id': '${widget.userOfferModel.orderId}',
                              'cost': cost
                            });
                            Navigator.of(context).pop();
                          } else {
                            showToast(text: 'please add your new price');
                          }
                        },
                        child: Text(
                          'ارسال'.tr,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff00afa0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        color: Color(0xff00afa0))))),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
