(define (domain BELKAN)
  (:requirements :strips :typing)
  (:types jugador personaje objeto zona orientacion)
  (:predicates
    (posicion_jugador ?x - jugador ?y - zona)
    (direccion_jugador ?x - jugador ?y - orientacion) ;está el jugador x mirando al norte, sur, etc?
    ;(conectadas ?x - zona ?y - zona) ;están dos zonas conectadas?
    ;(posicion_zonas ?x - zona ?y - orientacion ?z - zona) ;la zona x está en la posición y respecto de la zona z?
    (posicion_objeto ?x - objeto ?y - zona) ;está un objeto x en la zona y?
    (jugador_tiene_objeto ?x - jugador ?y - objeto) ;el jugador x tiene el objeto y
    ;(personaje_tiene_objeto ?x - personaje ?y - objeto) ;el personaje x tiene el objeto y
    (jugador_sin_objeto ?x - jugador) ;el jugador x tiene las manos vacías
    ;(personaje_sin_objeto ?x - personaje) ;el personaje x tiene las manos vacías
  )

  (:action jugador_coge_objeto
    :parameters (?x - jugador ?y - objeto ?z - zona)
    :precondition (and (jugador_sin_objeto ?x) (posicion_jugador ?x ?z) (posicion_objeto ?y ?z))
    :effect
    (and
      (not (jugador_sin_objeto ?x))
      (not (posicion_objeto ?y ?z))
      (jugador_tiene_objeto ?x ?y)
    )
  )

  (:action girar_derecha
    :parameters (?x - jugador) ;hay un jugador
    :effect
    (and
      (when (direccion_jugador ?x norte) (direccion_jugador ?x este)) ;si está mirando al norte, mira al este
      (when (direccion_jugador ?x este) (direccion_jugador ?x sur)) ;si está mirando al este, mira al sur
      (when (direccion_jugador ?x sur) (direccion_jugador ?x oeste)) ;si está mirando al sur, mira al oeste
      (when (direccion_jugador ?x oeste) (direccion_jugador ?x norte))  ;si está mirando al oeste, mira al norte
    )
  )

  (:action girar_izquierda
    :parameters (?x - jugador) ;hay un jugador
    :effect
    (and
      (when (direccion_jugador ?x norte) (direccion_jugador ?x oeste)) ;si está mirando al norte, mira al oeste
      (when (direccion_jugador ?x este) (direccion_jugador ?x norte)) ;si está mirando al este, mira al norte
      (when (direccion_jugador ?x sur) (direccion_jugador ?x este)) ;si está mirando al sur, mira al este
      (when (direccion_jugador ?x oeste) (direccion_jugador ?x sur))  ;si está mirando al oeste, mira al sur
    )
  )

)
