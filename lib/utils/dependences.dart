import 'package:get/get.dart';
import 'package:test_app/controller/homeController.dart';

Future <void> init()async{

//final storage=GetStorage();


Get.lazyPut(() => HomeController());
}