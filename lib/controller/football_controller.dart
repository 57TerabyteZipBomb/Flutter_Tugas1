import 'package:flutter_project_1/objects%20idk/player_model.dart';
import 'package:get/get.dart';

class FootballController extends GetxController{
  //reactive list
  var players = <Player>[
    Player(name: 'guy 1', position: 'forward', number: '15'),
    Player(name: 'guy 2', position: 'forward', number: '12'),
    Player(name: 'guy 3', position: 'forward', number: '14'),
    Player(name: 'guy 4', position: 'forward', number: '30'),
    Player(name: 'guy 5', position: 'forward', number: '32'),
  ].obs;

  void updatePlayer(int index, Player updatedPlayer) {
    players[index] = updatedPlayer;
  }
}