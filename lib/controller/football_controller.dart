import 'package:flutter_project_1/models/player_model.dart';
import 'package:get/get.dart';

class FootballController extends GetxController{
  //reactive list
  var players = <Player>[
    Player(name: 'guy 1', position: 'forward', number: '15', imagepath: 'assets/Slime.png'),
    Player(name: 'guy 2', position: 'forward', number: '12', imagepath: 'assets/Slime.png'),
    Player(name: 'guy 3', position: 'forward', number: '14', imagepath: 'assets/Slime.png'),
    Player(name: 'guy 4', position: 'forward', number: '30', imagepath: 'assets/Slime.png'),
    Player(name: 'guy 5', position: 'forward', number: '32', imagepath: 'assets/Slime.png'),
  ].obs;

  void updatePlayer(int index, Player updatedPlayer) {
    players[index] = updatedPlayer;
  }
}