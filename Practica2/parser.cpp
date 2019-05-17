#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int main(int argc, char *argv[]){
  if (argc < 2){
    return -1;
  }

  //archivo de entrada
  ifstream myfile;
  string line;
  myfile.open(argv[1]);

  //archivo de salida
  ofstream salida;
  salida.open("problema_salida.pddl");

  salida << "(define ";

  getline(myfile, line); //nombre del dominio
  if (line.substr(0,8) != "Dominio:"){
    return -1;
  }

  string dominio = line.substr(8, line.npos);

  getline(myfile, line);
  while (line == "\n"){
    getline(myfile, line);
  }

  if (line.substr(0,9) != "Problema:"){ //nombre del problema
    return -1;
  }

  string problema = line.substr(9, line.npos);
  salida << "(problem " << problema << ") ";
  salida << "(:domain " << dominio << ") ";

  getline(myfile, line);
  while (line == "\n"){
    getline(myfile, line);
  }

  if (line.substr(0,16) != "numero de zonas:"){ //numero de zonas del problema
    return -1;
  }
  string num_zonas = line.substr(16, line.npos);

  getline(myfile, line);
  while (line == ""){
    getline(myfile, line);
  }

  vector<string> todas_zonas;
  vector<pair<string,string> > todos_objetos;
  vector<vector<pair<string,string> > > zonas_conectadasV, zonas_conectadasH;

  int pos = 0;
  int contador = 0;
  vector<int> num_objetos;
  while (line != ""){
    vector<string> zonas;
    vector<pair<string,string> > objetos;
    pos = 0;
    if (line.substr(pos,1) == "H"){
      vector<pair<string,string> > zonas_conectadas_horizontal;
      //1 - 4 --> " -> "
      pos += 5;
      //lee el resto de la línea
      while (line.substr(pos,1) != ""){
          //leer nombre de la zona
          string zona;
          while (line.substr(pos,1) != "["){
            zona.append(line.substr(pos,1));
            pos++;
          }

          zonas.push_back(zona);
          pos++;
          //lee lo de dentro del corchete
          if (line.substr(pos,1) != "]"){
            //hay algo en la zona
            string objeto;
            while (line.substr(pos,1) != "-"){
              objeto.append(line.substr(pos,1));
              pos++;
            }
            pos++;

            string clase;
            while (line.substr(pos,1) != "]"){
              clase.append(line.substr(pos,1));
              pos++;
            }
            objetos.push_back(make_pair(objeto,clase));
            if (line.substr(pos,1) != "\n"){ //si no ha llegado al final
              pos++; //espacio entre zonas
              if (line.substr(pos,1) != ""){
                pos++; //siguiente zona
              }
            }
          }
          else{
            pos++;
            if (line.substr(pos,1) != ""){
              pos++;
            }
            //no hay nada en la zona -> mete strings vacíos
            objetos.push_back(make_pair(" ", " "));
          }
          contador++;
        }
      //ya ha leído todas las zonas y los objetos que tienen dentro
      for (int i=0 ; i < zonas.size()-1 ; i++){ //guardar las relaciones que hay en la fila
        zonas_conectadas_horizontal.push_back(make_pair(zonas[i],zonas[i+1]));
      }
      zonas_conectadasH.push_back(zonas_conectadas_horizontal);

      //todas_zonas.push_back(zonas);
      todas_zonas.insert(todas_zonas.end(), zonas.begin(), zonas.end());
      //todos_objetos.push_back(objetos);
      todos_objetos.insert(todos_objetos.end(), objetos.begin(), objetos.end());
    }
    else if (line.substr(pos,1) == "V"){
      vector<pair<string,string> > zonas_conectadas_vertical;
      //1 - 4 --> " -> "
      pos += 5;
      //lee el resto de la línea
      while (line.substr(pos,1) != ""){
          //leer nombre de la zona
          string zona;
          while (line.substr(pos,1) != "["){
            zona.append(line.substr(pos,1));
            pos++;
          }

          zonas.push_back(zona);
          pos++;
          //lee lo de dentro del corchete
          if (line.substr(pos,1) != "]"){
            //hay algo en la zona
            string objeto;
            while (line.substr(pos,1) != "-"){
              objeto.append(line.substr(pos,1));
              pos++;
            }
            pos++;

            string clase;
            while (line.substr(pos,1) != "]"){
              clase.append(line.substr(pos,1));
              pos++;
            }
            objetos.push_back(make_pair(objeto,clase));
            if (line.substr(pos,1) != "\n"){ //si no ha llegado al final
              pos++; //espacio entre zonas
              if (line.substr(pos,1) != ""){
                pos++; //siguiente zona
              }
            }
          }
          else{
            pos++;
            if (line.substr(pos,1) != ""){
              pos++;
            }
            //no hay nada en la zona -> mete strings vacíos
            objetos.push_back(make_pair(" ", " "));
          }
          contador++;
        }
      //ya ha leído todas las zonas y los objetos que tienen dentro
      for (int i=0 ; i < zonas.size()-1 ; i++){ //guardar las relaciones que hay en la fila
        zonas_conectadas_vertical.push_back(make_pair(zonas[i],zonas[i+1]));
      }
      zonas_conectadasV.push_back(zonas_conectadas_vertical);

      //todas_zonas.push_back(zonas);
      todas_zonas.insert(todas_zonas.end(), zonas.begin(), zonas.end());
      //todos_objetos.push_back(objetos);
      todos_objetos.insert(todos_objetos.end(), objetos.begin(), objetos.end());
    }
    num_objetos.push_back(contador);
    getline(myfile,line);
  }

  vector<string> aux = todas_zonas;
  sort(aux.begin(), aux.end());
  vector<string>::iterator it = unique(aux.begin(), aux.end());
  vector<string> zonas_unicas(aux.begin(),it);

  salida << "(:objects ";
  for (int i = 0 ; i < zonas_unicas.size() ; i++){
    salida << zonas_unicas[i] << " ";
  }

  salida << "- zona ";

  vector<pair<string,string> > obj_aux = todos_objetos;
  sort(obj_aux.begin(), obj_aux.end());
  vector<pair<string,string> >::iterator it_obj = unique(obj_aux.begin(), obj_aux.end());
  vector<pair<string,string> > objetos_unicos(obj_aux.begin(), it_obj);

  vector<string> personajes;
  string jugador;
  vector<string> objetos;
  for (int i = 0 ; i < objetos_unicos.size() ; i++){
    pair<string,string> par = objetos_unicos[i];
    if (par.second == "Princesa" || par.second == "Bruja" || par.second == "Principe" || par.second == "Profesor" || par.second == "Leonardo"){
      personajes.push_back(par.first);
    }
    else if (par.second == "Player"){
      jugador = par.first;
    }
    else{
      objetos.push_back(par.first);
    }
  }

  salida << jugador << " - jugador ";

  for (int i = 0 ; i < personajes.size() ; i++){
    salida << personajes[i] << " ";
  }

  salida << "- personaje ";

  for (int i = 0 ; i < objetos.size() ; i++){
    salida << objetos[i] << " ";
  }

  salida << "- objeto ";
  salida << "norte sur este oeste - orientacion)" << endl;

  salida << "(:INIT ";

  contador = 0;
  for (it_obj = todos_objetos.begin() ; it_obj != todos_objetos.end() ; it_obj++){
    if (it_obj->second == "Princesa" || it_obj->second == "Bruja" || it_obj->second == "Principe" || it_obj->second == "Profesor" || it_obj->second == "Leonardo"){
      salida << "(personaje_sin_objeto " << it_obj->first << ") ";

      string zona = todas_zonas[contador];
      salida << "(posicion_personaje " << it_obj->first << " " << zona << ") ";
    }
    else if (it_obj->second == "Player"){
      salida << "(jugador_sin_objeto " << it_obj->first << ") ";

      string zona = todas_zonas[contador];
      salida << "(posicion_jugador " << it_obj->first << " " << zona << ") ";

      salida << "(direccion_jugador norte)";
    }
    else if (it_obj->first != " "){
      string zona = todas_zonas[contador];
      salida << "(posicion_objeto " << it_obj->first << " " << zona << ") ";
    }
    contador++;
  }

  vector<vector<pair<string,string> > >::iterator iterador;
  for (iterador = zonas_conectadasH.begin() ; iterador != zonas_conectadasH.end() ; iterador++){
    contador = 0;
    for (it_obj = iterador->begin() ; it_obj != iterador->end() ; it_obj++){
      salida << "(conectadas " << it_obj->first << " " << it_obj->second << ") ";
      salida << "(posicion_zonas " << it_obj->first << " oeste " << it_obj->second << ") ";
      salida << "(conectadas " << it_obj->second << " " << it_obj->first << ") ";
      salida << "(posicion_zonas " << it_obj->second << " este " << it_obj->first << ") ";
      contador++;
    }
  }

  for (iterador = zonas_conectadasV.begin() ; iterador != zonas_conectadasV.end() ; iterador++){
    contador = 0;
    for (it_obj = iterador->begin() ; it_obj != iterador->end() ; it_obj++){
      salida << "(conectadas " << it_obj->first << " " << it_obj->second << ") ";
      salida << "(posicion_zonas " << it_obj->first << " norte " << it_obj->second << ") ";
      salida << "(conectadas " << it_obj->second << " " << it_obj->first << ") ";
      salida << "(posicion_zonas " << it_obj->second << " sur " << it_obj->first << ") ";
      contador++;
    }
  }

  salida << ")";
  salida.close();
  myfile.close();
}
