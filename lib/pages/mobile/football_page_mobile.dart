import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/football_controller.dart';
import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

//what is going on bro
class FootballPageMobile extends StatelessWidget {
  FootballPageMobile({super.key});
  final footballController = Get.find<FootballController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        //obx since this updates and stuff
        child: Obx(
          //built in adapter
          () => ListView.builder(
            itemCount: footballController.players.length,
            itemBuilder: (context, index) {
              //grab individual player object from array
              final player = footballController.players[index];
              //awesome card
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                //list tile as child of card
                child: ListTile(
                  //style stuff
                  contentPadding: const EdgeInsets.all(16),
                  //image
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(player.imagepath),
                  ),
                  //actual tile content
                  title: Text(
                    player.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '${player.position}, #${player.number}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  //tap functionality
                  onTap: () {
                    //i could go for a snack(bar)
                    Get.snackbar(
                      'Item clicked',
                      player.name,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black87,
                      colorText: Colors.white,
                      borderRadius: 12,
                      margin: const EdgeInsets.all(12),
                    );

                    // switch to Edit tab
                    Get.toNamed(AppRoutes.footballedit, arguments: index);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
