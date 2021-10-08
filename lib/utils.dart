bool player = false;
int range = 3;
int dim = 8;
bool bot = false;
List <int> index = [];
List <List <int>> empty = [
  [0, 0, 0],
  [0, 0, 0],
  [0, 0, 0]
];

bool isFull(List<List<int>> empty){
  if(empty.every((element) => element.every((element) => element != 0))){
    return true;
  }
  return false;
}

void reset(List <List <int>> list){
  player = false;
  dim = range * range -1;
  for(int i = 0; i  < list.length; i++){
    for(int j = 0; j  < list.length; j++){
      list[i][j] = 0;
    }
  }
}

bool playerWin(int x, int y, int dx, int dy, List<List<int>> empty){
  int playerWin = 0;
  int dimension = 3;
  for(int i = 0; i  < dimension; i++){
    if(x + i * dx < empty.length && x + i * dx >= 0 && y + i * dy >= 0 && y + i * dy < empty.length){
      for(int j = -i + 1; j  < i + dimension; j++){
        if(x - j * dx < empty.length && x - j * dx >= 0 && y - j * dy >= 0 && y - j * dy < empty.length){
          if( empty[x + i * dx][y + i * dy] == empty[x - j * dx][y - j * dy]){
            playerWin = playerWin + 1;
          }
          else{
            break;
          }
        }
        else{
          break;
        }
      }
      if( playerWin == dimension - 1){
        return true;
      }
      playerWin = 0;
    }
  }
  return false;
}

bool gameOver(int i, int j, List <List <int>> list){
  if(playerWin(i, j, 1, 0, list) || playerWin(i, j, 0, 1, list) || playerWin(i, j, 1, 1, list) || playerWin(i, j, 1, -1, list)){
    return true;
  }
  return false;
}