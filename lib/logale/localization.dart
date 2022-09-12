// ignore_for_file: unused_local_variable
import 'package:alnagel/languages/ar.dart';
import 'package:alnagel/languages/en.dart';
import 'package:alnagel/languages/bd.dart';
import 'package:alnagel/languages/hi.dart';
import 'package:alnagel/languages/urd.dart';
import 'package:get/get.dart';

class AppLocalization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': arabic,
        'en': english,
        'hi': hindi,
        'BD': bdd,
        'urd': urdu,
      };
}
