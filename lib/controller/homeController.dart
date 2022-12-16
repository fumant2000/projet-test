import 'package:get/state_manager.dart';

class HomeController extends GetxController{

var increment = 0.obs;


void up(){
  increment=increment++;
}

}