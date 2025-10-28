import 'package:get/get.dart';
import 'package:flutter_project_1/models/player_model.dart';
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

  // default value because flutter is silly
  late Rx<Player> player = Player(
    name: '',
    position: '',
    number: '',
    imagepath: 'assets/Slime.png',
  ).obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    if (args != null && args is int) {
      loadPlayer(args);
    }
  }

  void loadPlayer(int idx) {
    index = idx;
    player.value = footballController.players[idx];
    nameController.text = player.value.name;
    positionController.text = player.value.position;
    numberController.text = player.value.number;
  }

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

      // switch back to Players tab
      Get.back();

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
