(define
  (problem BELKAN1)
  (:domain BELKAN)
  (:objects Z1 Z2 Z3 Z4 Z5 Z6 Z7 Z8 Z9 Z10 Z11 Z12 Z13 Z14 Z15 Z16 Z17 Z18 Z19 Z20 Z21 Z22 Z23 Z24 Z25 - zona
            norte sur este oeste - orientacion)
  (:INIT
    (conectadas Z1 Z2)
    (conectadas Z2 Z1)
    (posicion_zonas Z2 norte Z1)
    (posicion_zonas Z1 sur Z2)

    (conectadas Z1 Z3)
    (conectadas Z3 Z1)
    (posicion_zonas Z3 este Z1)
    (posicion_zonas Z1 oeste Z3)

    (conectadas Z1 Z4)
    (conectadas Z4 Z1)
    (posicion_zonas Z4 sur Z1)
    (posicion_zonas Z1 norte Z4)

    (conectadas Z1 Z5)
    (conectadas Z5 Z1)
    (posicion_zonas Z5 oeste Z1)
    (posicion_zonas Z1 este Z5)

    (conectadas Z2 Z6)
    (conectadas Z6 Z2)
    (posicion_zonas Z6 norte Z2)
    (posicion_zonas Z2 sur Z6)

    (conectadas Z6 Z7)
    (conectadas Z7 Z6)
    (posicion_zonas Z6 oeste Z7)
    (posicion_zonas Z7 este Z6)

    (conectadas Z3 Z8)
    (conectadas Z8 Z3)
    (posicion_zonas Z8 norte Z3)
    (posicion_zonas Z3 sur Z8)

    (conectadas Z3 Z10)
    (conectadas Z10 Z3)
    (posicion_zonas Z3 oeste Z10)
    (posicion_zonas Z10 este Z3)

    (conectadas Z10 Z25)
    (conectadas Z25 Z10)
    (posicion_zonas Z10 sur Z25)
    (posicion_zonas Z25 norte Z10)

    (conectadas Z3 Z9)
    (conectadas Z9 Z3)
    (posicion_zonas Z3 norte Z9)
    (posicion_zonas Z9 sur Z3)

    (conectadas Z9 Z24)
    (conectadas Z24 Z9)
    (posicion_zonas Z9 oeste Z24)
    (posicion_zonas Z24 este Z9)

    (conectadas Z4 Z9)
    (conectadas Z9 Z4)
    (posicion_zonas Z4 oeste Z9)
    (posicion_zonas Z9 este Z4)

    (conectadas Z4 Z22)
    (conectadas Z22 Z4)
    (posicion_zonas Z4 norte Z22)
    (posicion_zonas Z22 sur Z4)

    (conectadas Z22 Z23)
    (conectadas Z23 Z22)
    (posicion_zonas Z22 oeste Z23)
    (posicion_zonas Z23 este Z22)

    (conectadas Z5 Z11)
    (conectadas Z11 Z5)
    (posicion_zonas Z5 norte Z11)
    (posicion_zonas Z11 sur Z5)

    (conectadas Z11 Z12)
    (conectadas Z12 Z11)
    (posicion_zonas Z11 norte Z12)
    (posicion_zonas Z12 sur Z11)

    (conectadas Z11 Z13)
    (conectadas Z13 Z11)
    (posicion_zonas Z11 este Z13)
    (posicion_zonas Z13 oeste Z11)

    (conectadas Z5 Z15)
    (conectadas Z15 Z5)
    (posicion_zonas Z5 sur Z15)
    (posicion_zonas Z15 norte Z5)

    (conectadas Z15 Z17)
    (conectadas Z17 Z15)
    (posicion_zonas Z15 sur Z17)
    (posicion_zonas Z17 norte Z15)

    (conectadas Z14 Z5)
    (conectadas Z5 Z14)
    (posicion_zonas Z5 este Z14)
    (posicion_zonas Z14 oeste Z5)

    (conectadas Z15 Z16)
    (conectadas Z16 Z15)
    (posicion_zonas Z15 este Z16)
    (posicion_zonas Z16 oeste Z15)

    (conectadas Z16 Z18)
    (conectadas Z18 Z16)
    (posicion_zonas Z16 sur Z18)
    (posicion_zonas Z18 norte Z16)

    (conectadas Z16 Z21)
    (conectadas Z21 Z16)
    (posicion_zonas Z16 este Z21)
    (posicion_zonas Z21 oeste Z16)

    (conectadas Z14 Z19)
    (conectadas Z19 Z14)
    (posicion_zonas Z14 este Z19)
    (posicion_zonas Z19 oeste Z14)

    (conectadas Z19 Z21)
    (conectadas Z21 Z19)
    (posicion_zonas Z21 norte Z19)
    (posicion_zonas Z19 sur Z21)

    (conectadas Z19 Z20)
    (conectadas Z20 Z19)
    (posicion_zonas Z19 norte Z20)
    (posicion_zonas Z20 sur Z19)
  )

  (:goal (personaje_tiene_objeto P O))
)
