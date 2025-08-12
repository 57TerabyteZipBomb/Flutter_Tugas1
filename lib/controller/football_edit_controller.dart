import 'package:flutter_project_1/controller/football_controller.dart';
import 'package:flutter_project_1/objects%20idk/player_model.dart';
import 'package:get/get.dart';

class FootballEditController extends GetxController{
  //late since its not assigned yet
  late int index;
  late Rx<Player> player;
  //find my controllers
  final FootballController footballController = Get.find();

  //on initiate
  @override
  void onInit() {
    super.onInit();

    //retrieve arguments that got passed from football page
    final args = Get.arguments as Map<String, dynamic>;
    index = args['index'] as int;
    Player initialPlayer = args['player'] as Player;

    player = initialPlayer.obs;
  }

  //update functions, yay
  void updateName(String value) => player.update((p) {
        if (p != null) p.name = value;
      });

  void updatePosition(String value) => player.update((p) {
        if (p != null) p.position = value;
      });

  void updateNumber(String value) => player.update((p) {
        if (p != null) p.number = value;
      });

  void saveChanges() {
    footballController.updatePlayer(index, player.value);
  }
}