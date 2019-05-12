(define
  (problem BELKAN1)
  (:domain BELKAN)
  (:objects J - jugador
            O - objeto
            Z - zona
            norte sur este oeste - orientacion)
  (:INIT
    (posicion_jugador J Z)
    (posicion_objeto O Z)
    (jugador_sin_objeto J)
    (direccion_jugador J norte)
  )
  (:goal (jugador_tiene_objeto J O))
)
