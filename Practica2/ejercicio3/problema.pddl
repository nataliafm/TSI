(define
  (problem BELKAN1)
  (:domain BELKAN)
  (:objects z1 z2 z3 z4 z5 z6 z7 - zona
            player1 - jugador
            bruja1 princesa1 - personaje
            manzana1 oscar1 zapatilla bikini - objeto
            norte sur este oeste - orientacion)
  (:INIT
    (personaje_sin_objeto bruja1)
    (posicion_personaje bruja1 z1)

    (jugador_sin_objeto player1)
    (posicion_jugador player1 z3)
    (direccion_jugador player1 norte)
    (jugador_mochila_vacia player1)

    (posicion_objeto manzana1 z4)
    (posicion_objeto oscar1 z5)

    (personaje_sin_objeto princesa1)
    (posicion_personaje princesa1 z7)


    (conectadas z2 z3) (posicion_zonas z2 oeste z3) (conectadas z3 z2) (posicion_zonas z3 este z2) (= (distancia z2 z3) 10) (= (distancia z3 z2) 10)
    (conectadas z3 z4) (posicion_zonas z3 oeste z4) (conectadas z4 z3) (posicion_zonas z4 este z3) (= (distancia z3 z4) 5) (= (distancia z4 z3) 5)
    (conectadas z5 z6) (posicion_zonas z5 oeste z6) (conectadas z6 z5) (posicion_zonas z6 este z5) (= (distancia z5 z6) 10) (= (distancia z6 z5) 10)
    (conectadas z6 z7) (posicion_zonas z6 oeste z7) (conectadas z7 z6) (posicion_zonas z7 este z6) (= (distancia z6 z7) 5) (= (distancia z7 z6) 5)
    (conectadas z1 z3) (posicion_zonas z1 norte z3) (conectadas z3 z1) (posicion_zonas z3 sur z1) (= (distancia z1 z3) 10) (= (distancia z3 z1) 10)
    (conectadas z3 z6) (posicion_zonas z3 norte z6) (conectadas z6 z3) (posicion_zonas z6 sur z3) (= (distancia z3 z6) 5) (= (distancia z6 z3) 5)

    (objeto_es_bikini bikini)
    (posicion_objeto bikini Z6)
    (objeto_es_zapatilla zapatilla)
    (posicion_objeto zapatilla Z3)

    (zona_es_arena Z1)
    (zona_es_precipicio Z2)
    (zona_es_arena Z3)
    (zona_es_arena Z4)
    (zona_es_arena Z5)
    (zona_es_bosque Z6)
    (zona_es_agua Z7)

    (= (distancia_total) 0)
  )
  (:goal (and (personaje_tiene_objeto bruja1 manzana1) (personaje_tiene_objeto princesa1 oscar1)))
)
