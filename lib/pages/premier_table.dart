import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/premier_table_controller.dart';
import 'package:get/get.dart';

class PremierTablePage extends StatelessWidget {
  PremierTablePage({super.key});

  final PremierTableController controller = Get.find<PremierTableController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PREMIERE!!!!!!"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx((){

          if (controller.isLoading.value == false) {

            return RefreshIndicator(
              onRefresh: controller.fetchPremiereLeague,
              child: ListView.builder(
              itemCount: controller.standings.length,
              itemBuilder: (context, index) {
                final team = controller.standings[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(team.strBadge),),
                    title: Text(team.strTeam),
                    subtitle: Text("Played: " + team.intPlayed + " | W: " + team.intWin + " | L: " + team.intLoss + " | D: " + team.intDraw),
                    trailing: Text(team.intPoints)
                  ),
                );
              }),
            );

          } else {
            return Center(
              child: CircularProgressIndicator()  
            );
          }
        })
      ),
    );
  }
}