// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/user/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserTrackingScreen extends StatefulWidget {
  const UserTrackingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserTrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<UserTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          centerTitle: false,
          title: Text(
            'رجوع'.tr,
            style: const TextStyle(color: Colors.black),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
                color: Colors.black,
              )),
        ),
        body: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Colors.white,
              ),
            ),
            child: Stack(
              children: [
                const UserMapScreen(
                  userId: '35',
                ),
                // Positioned(bottom: 12, right: 8, left: 8, child: infoCard()),
              ],
            )),
      ),
    );
  }

  // Widget infoCard() {
  //   return Container(
  //     width: 350,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(5.0),
  //     ),
  //     child: Column(
  //       children: [
  //         ListTile(
  //           contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
  //           title: Text(widget.name,
  //               style: TextStyle(
  //                   fontWeight: FontWeight.w500,
  //                   fontSize: 16,
  //                   color: Colors.grey.shade400)),
  //           subtitle: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 4.0),
  //             child: Row(
  //               children: [
  //                 Text(widget.rating.toString(),
  //                     textAlign: TextAlign.end,
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 12,
  //                         color: Colors.grey.shade400)),
  //                 const SizedBox(
  //                   width: 3,
  //                 ),
  //                 const Icon(
  //                   Icons.star_rounded,
  //                   color: Colors.amber,
  //                   size: 18.0,
  //                 ),
  //               ],
  //             ),
  //           ),
  //           leading: CircleAvatar(
  //             backgroundColor: Colors.grey[400],
  //             maxRadius: 24.0,
  //           ),
  //           trailing: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               GestureDetector(
  //                 onTap: () {},
  //                 child: CircleAvatar(
  //                   maxRadius: 21.0,
  //                   backgroundColor: Colors.white,
  //                   child: Icon(
  //                     Icons.messenger_outline_rounded,
  //                     color: Colors.teal,
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 10.0,
  //               ),
  //               GestureDetector(
  //                 onTap: () {},
  //                 child: CircleAvatar(
  //                     maxRadius: 21.0,
  //                     backgroundColor: Colors.grey,
  //                     child: SvgPicture.asset(
  //                       'assets/img/icon_phone_call.svg',
  //                     )),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 12),
  //           child: Divider(
  //             color: Colors.grey[600],
  //             thickness: 2,
  //           ),
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Column(
  //               children: [
  //                 Text(
  //                   'المسافة'.tr,
  //                   style: TextStyle(
  //                       fontWeight: FontWeight.w400,
  //                       fontSize: 14,
  //                       color: Colors.grey.shade400),
  //                 ),
  //                 const SizedBox(
  //                   height: 7,
  //                 ),
  //                 Text(
  //                   '12' + ' km',
  //                   style: TextStyle(
  //                       fontWeight: FontWeight.w700,
  //                       fontSize: 14,
  //                       color: Colors.grey.shade400),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(17.0),
  //           child: SizedBox(
  //             height: 40,
  //             width: 180,
  //             child: ElevatedButton(
  //               onPressed: () {},
  //               style: ButtonStyle(
  //                 elevation: MaterialStateProperty.all(0),
  //                 backgroundColor: MaterialStateProperty.all(Colors.teal),
  //                 shape: MaterialStateProperty.all(
  //                   RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(5.0),
  //                   ),
  //                 ),
  //               ),
  //               child: Text(
  //                 'تأكيد الاستلام'.tr,
  //                 style: const TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: Colors.white),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
