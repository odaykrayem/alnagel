    import 'package:alnagel/shared/cubit.dart';
import 'package:alnagel/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'componant.dart';

class conditions extends StatefulWidget {
  @override
  _conditionsState createState() => _conditionsState();
}

class _conditionsState extends State<conditions> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => cubitapi(),
    child: BlocConsumer<cubitapi, statesapi>(
    listener: (context, state) {},
    builder: (context, state) {
    cubitapi co = cubitapi.get(context);

    return Scaffold(body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.only(top:20.0,right: 10,left: 10),
    child: Container(
    child: Column(children: [
    myrow('TermsAndConditions'.tr),
    ])))));
    }));
  }
}
