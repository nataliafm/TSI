(define
  (problem BELKAN1)
  (:domain BELKAN)
  (:objects Z1 Z2 Z3 Z4 Z5 Z6 Z7 Z8 Z9 Z10 Z11 Z12 Z13 Z14 Z15 Z16 Z17 Z18 Z19 Z20 Z21 Z22 Z23 Z24 Z25 - zona
            norte sur este oeste - orientacion
            leo princesa principe bruja profesor - personaje
            oscar algoritmo rosa oro manzana zapatilla bikini - objeto
            PLAYER - jugador)
  (:INIT
    ;(personaje_sin_objeto leo)
    (posicion_personaje leo Z11)
    (posicion_objeto oscar Z8)

    ;(personaje_sin_objeto princesa)
    (posicion_personaje princesa Z2)
    (posicion_objeto oscar Z13)

    ;(personaje_sin_objeto bruja)
    (posicion_personaje bruja Z10)
    (posicion_objeto manzana Z14)

    ;(personaje_sin_objeto principe)
    (posicion_personaje principe Z6)
    (posicion_objeto manzana Z5)

    ;(personaje_sin_objeto profesor)
    (posicion_personaje profesor Z9)
    (posicion_objeto oscar Z4)

    (jugador_sin_objeto PLAYER)
    (posicion_jugador PLAYER Z1)
    (direccion_jugador PLAYER norte)
    (jugador_mochila_vacia PLAYER)

    (conectadas Z1 Z2)
    (conectadas Z2 Z1)
    (posicion_zonas Z2 norte Z1)
    (posicion_zonas Z1 sur Z2)
    (= (distancia Z1 Z2) 1)
    (= (distancia Z2 Z1) 1)

    (conectadas Z1 Z3)
    (conectadas Z3 Z1)
    (posicion_zonas Z3 este Z1)
    (posicion_zonas Z1 oeste Z3)
    (= (distancia Z1 Z3) 1)
    (= (distancia Z3 Z1) 1)

    (conectadas Z1 Z4)
    (conectadas Z4 Z1)
    (posicion_zonas Z4 sur Z1)
    (posicion_zonas Z1 norte Z4)
    (= (distancia Z1 Z4) 1)
    (= (distancia Z4 Z1) 1)

    (conectadas Z1 Z5)
    (conectadas Z5 Z1)
    (posicion_zonas Z5 oeste Z1)
    (posicion_zonas Z1 este Z5)
    (= (distancia Z1 Z5) 1)
    (= (distancia Z5 Z1) 1)

    (conectadas Z2 Z6)
    (conectadas Z6 Z2)
    (posicion_zonas Z6 este Z2)
    (posicion_zonas Z2 oeste Z6)
    (= (distancia Z2 Z6) 1)
    (= (distancia Z6 Z2) 1)

    (conectadas Z6 Z7)
    (conectadas Z7 Z6)
    (posicion_zonas Z6 sur Z7)
    (posicion_zonas Z7 norte Z6)
    (= (distancia Z6 Z7) 1)
    (= (distancia Z6 Z7) 1)

    (conectadas Z3 Z9)
    (conectadas Z9 Z3)
    (posicion_zonas Z3 norte Z9)
    (posicion_zonas Z9 sur Z3)
    (= (distancia Z3 Z9) 1)
    (= (distancia Z9 Z3) 1)

    (conectadas Z4 Z9)
    (conectadas Z9 Z4)
    (posicion_zonas Z4 oeste Z9)
    (posicion_zonas Z9 este Z4)
    (= (distancia Z4 Z9) 1)
    (= (distancia Z9 Z4) 1)

    (conectadas Z5 Z11)
    (conectadas Z11 Z5)
    (posicion_zonas Z5 sur Z11)
    (posicion_zonas Z11 norte Z5)
    (= (distancia Z5 Z11) 1)
    (= (distancia Z11 Z5) 1)

    (conectadas Z11 Z12)
    (conectadas Z12 Z11)
    (posicion_zonas Z11 sur Z12)
    (posicion_zonas Z12 norte Z11)
    (= (distancia Z11 Z12) 1)
    (= (distancia Z12 Z11) 1)

    (conectadas Z10 Z4)
    (conectadas Z4 Z10)
    (posicion_zonas Z10 oeste Z4)
    (posicion_zonas Z4 este Z10)
    (= (distancia Z10 Z4) 1)
    (= (distancia Z4 Z10) 1)

    (conectadas Z10 Z5)
    (conectadas Z5 Z10)
    (posicion_zonas Z10 sur Z5)
    (posicion_zonas Z5 norte Z10)
    (= (distancia Z10 Z5) 1)
    (= (distancia Z5 Z10) 1)

    (conectadas Z12 Z8)
    (conectadas Z8 Z12)
    (posicion_zonas Z12 oeste Z8)
    (posicion_zonas Z8 este Z12)
    (= (distancia Z12 Z8) 1)
    (= (distancia Z8 Z12) 1)

    (conectadas Z8 Z7)
    (conectadas Z7 Z8)
    (posicion_zonas Z8 oeste Z7)
    (posicion_zonas Z7 este Z8)
    (= (distancia Z8 Z7) 1)
    (= (distancia Z7 Z8) 1)

    (conectadas Z3 Z6)
    (conectadas Z6 Z3)
    (posicion_zonas Z3 sur Z6)
    (posicion_zonas Z6 norte Z3)
    (= (distancia Z3 Z6) 1)
    (= (distancia Z6 Z3) 1)

    (conectadas Z14 Z6)
    (conectadas Z6 Z14)
    (posicion_zonas Z14 este Z6)
    (posicion_zonas Z6 oeste Z14)
    (= (distancia Z14 Z6) 1)
    (= (distancia Z6 Z14) 1)

    (conectadas Z14 Z13)
    (conectadas Z13 Z14)
    (posicion_zonas Z14 norte Z13)
    (posicion_zonas Z13 sur Z14)
    (= (distancia Z14 Z13) 1)
    (= (distancia Z13 Z14) 1)

    (conectadas Z3 Z13)
    (conectadas Z13 Z3)
    (posicion_zonas Z3 oeste Z13)
    (posicion_zonas Z13 este Z3)
    (= (distancia Z3 Z13) 1)
    (= (distancia Z13 Z3) 1)

    (conectadas Z14 Z15)
    (conectadas Z15 Z14)
    (posicion_zonas Z14 oeste Z15)
    (posicion_zonas Z15 este Z14)
    (= (distancia Z14 Z15) 1)
    (= (distancia Z15 Z14) 1)

    (= (distancia_total) 0)

    (zona_es_agua Z7)

    (zona_es_arena Z1)
    (zona_es_arena Z2)
    (zona_es_arena Z4)
    (zona_es_arena Z5)
    (zona_es_arena Z6)
    (zona_es_arena Z8)
    (zona_es_arena Z9)
    (zona_es_arena Z10)
    (zona_es_arena Z11)
    (zona_es_arena Z12)
    (zona_es_arena Z13)
    (zona_es_arena Z14)
    (zona_es_arena Z15)

    (zona_es_bosque Z3)

    (objeto_es_bikini bikini)
    (posicion_objeto bikini Z12)
    (objeto_es_zapatilla zapatilla)
    (posicion_objeto zapatilla Z7)

    (= (puntos leo oscar) 10)
    (= (puntos leo rosa) 1)
    (= (puntos leo manzana) 3)
    (= (puntos leo algoritmo) 4)
    (= (puntos leo oro) 5)

    (= (puntos princesa oscar) 5)
    (= (puntos princesa rosa) 10)
    (= (puntos princesa manzana) 1)
    (= (puntos princesa algoritmo) 3)
    (= (puntos princesa oro) 4)

    (= (puntos bruja oscar) 4)
    (= (puntos bruja rosa) 5)
    (= (puntos bruja manzana) 10)
    (= (puntos bruja algoritmo) 1)
    (= (puntos bruja oro) 3)

    (= (puntos profesor oscar) 3)
    (= (puntos profesor rosa) 4)
    (= (puntos profesor manzana) 5)
    (= (puntos profesor algoritmo) 10)
    (= (puntos profesor oro) 1)

    (= (puntos principe oscar) 1)
    (= (puntos principe rosa) 3)
    (= (puntos principe manzana) 4)
    (= (puntos principe algoritmo) 5)
    (= (puntos principe oro) 10)

    (= (puntos_jugador PLAYER) 0)
  )

  (:goal (= (puntos_jugador PLAYER) 50))
  (:metric minimize (distancia_total))
)