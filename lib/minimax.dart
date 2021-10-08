// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:morpion/utils.dart';

int minimax(List <List <int>> list, bool player, int node){
  List <int> minMax = List.generate(range * range , (index) => player ? 50 : 0);
  List <List<int>> temp  = List.generate(range , (i) => List.generate(range , (j) => list[i][j]));

  if(node == (dim~/(1.5))){
    return player ? 50 : 0;
  }

  for(int i = 0; i < range; i++){
    for(int j = 0; j < range; j++){
      if(temp[i][j] == 0){
        player ? temp[i][j] = 1 : temp[i][j] = 2;
        if(gameOver(i, j, temp)){
          player ? (node == dim - 1 ? minMax[(i * range) +j] = -4*node : minMax[(i * range) +j] = 2*node) : minMax[(i * range) +j] = 2*node;
        }
        else{
          node --;
          minMax[(i * range) +j] = minimax(temp, !player, node);
          node ++;
        }
        temp = List.generate(range , (i) => List.generate(range , (j) => list[i][j]));
      }
    }
  }

  if(node == dim){
    print(minMax);
    for(int i = 0; i < range * range; i++){
      if(max(minMax.sublist(i)) == minMax[i] &&  empty[i~/range][i % range] == 0){
        empty[i~/range][i % range] = 2;
        index.add(i~/range);
        index.add(i % range);
        break;
      } 
    }
  }

  return player ? min(minMax) : max(minMax);
}

int max(List<int> list){
  int max = list[0];
  for (var element in list) {
    if(element > max)
      max = element;
  }
  return max;
}

int min(List<int> list){
  int min = list[0];
  for (var element in list) {
    if(element < min)
      min = element;
  }
  return min;
}

