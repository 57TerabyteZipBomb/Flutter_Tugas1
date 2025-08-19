import 'package:get/get.dart';
import 'package:flutter_project_1/objects idk/player_model.dart';
import 'package:flutter_project_1/controller/football_controller.dart';
import 'package:flutter_project_1/controller/navigation_controller.dart';
import 'package:flutter/material.dart';

class FootballEditController extends GetxController {
  int? index;
  final FootballController footballController = Get.find();
  final NavigationController navController = Get.find();

  // text controllers
  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final numberController = TextEditingController();

  late Rx<Player> player;

  @override
  void onInit() {
    super.onInit();
    resetToDummy(); // always start with dummy
  }

  void loadPlayer(int idx, Player p) {
    index = idx;
    player.value = p;
    _syncToTextControllers();
  }

  void _syncToTextControllers() {
    nameController.text = player.value.name;
    positionController.text = player.value.position;
    numberController.text = player.value.number;
  }

  void resetToDummy() {
    index = null;
    player = Player(
      name: 'Dummy',
      position: 'Unknown',
      number: '0',
      imagepath: 'assets/Slime.png',
    ).obs;
    _syncToTextControllers();
  }

  void updateName(String value) => player.update((p) { if (p != null) p.name = value; });
  void updatePosition(String value) => player.update((p) { if (p != null) p.position = value; });
  void updateNumber(String value) => player.update((p) { if (p != null) p.number = value; });

  void saveChanges() {
    if (index == null) {
      // dummy data
      Get.snackbar(
        'Error',
        'Cannot save dummy data!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    } else {
      // update real player
      footballController.updatePlayer(index!, player.value);

      // reset to dummy for next time
      resetToDummy();

      // switch back to Players tab
      navController.changePage(1);

      // optional: success snackbar
      Get.snackbar(
        'Success',
        'Player updated!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green[700],
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    positionController.dispose();
    numberController.dispose();
    super.onClose();
  }
}