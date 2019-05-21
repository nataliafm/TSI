(define (domain BELKAN)
  (:requirements :strips :typing :fluents)
  (:types jugador personaje objeto zona orientacion)
  (:predicates
    (posicion_jugador ?x - jugador ?y - zona)             ;el jugador x está en la zona y
    (direccion_jugador ?x - jugador ?y - orientacion)     ;está el jugador x mirando al norte, sur, etc?
    (conectadas ?x - zona ?y - zona)                      ;están dos zonas conectadas?
    (posicion_zonas ?x - zona ?y - orientacion ?z - zona) ;la zona x está en la posición y respecto de la zona z
    (posicion_objeto ?x - objeto ?y - zona)               ;está un objeto x en la zona y?
    (jugador_tiene_objeto ?x - jugador ?y - objeto)       ;el jugador x tiene el objeto y
    (personaje_tiene_objeto ?x - personaje ?y - objeto)   ;el personaje x tiene el objeto y
    (jugador_sin_objeto ?x - jugador)                     ;el jugador x tiene las manos vacías
    (personaje_sin_objeto ?x - personaje)                 ;el personaje x tiene las manos vacías
    (posicion_personaje ?x - personaje ?y - zona)         ;el personaje x está en la zona y
  )

  (:action mover_jugador
    :parameters (?x - jugador ?z1 - zona ?z2 - zona ?o - orientacion) ;z1 = zona original z2 = zona a la que se va a mover
    ; el jugador está en la zona original. Esta tiene la zona objetivo en la dirección ?o, y el personaje está mirando en esa dirección. Las dos zonas están conectadas
    :precondition (and (posicion_jugador ?x ?z1) (conectadas ?z1 ?z2) (direccion_jugador ?x ?o) (posicion_zonas ?z2 ?o ?z1))
    :effect
    (and
      (not (posicion_jugador ?x ?z1)) ;el jugador ya no está en la zona 1
      (posicion_jugador ?x ?z2) ;el jugador está en la zona 2
    )
  )

  (:action entregar_objeto
    :parameters (?x - jugador ?y - objeto ?z - zona ?p - personaje)
    :precondition (and (jugador_tiene_objeto ?x ?y) (personaje_sin_objeto ?p) (posicion_jugador ?x ?z) (posicion_personaje ?p ?z)) ; el jugador tiene un objeto, el personaje tiene las manos vacías, y están en la misma zona
    :effect
    (and
      (not (jugador_tiene_objeto ?x ?y)) ;le quita el objeto al jugador
      (not (personaje_sin_objeto ?p)) ;el personaje ya no tiene las manos vacías
      (jugador_sin_objeto ?x)
      (personaje_tiene_objeto ?p ?y)
    )
  )

  (:action dejar_objeto
    :parameters (?x - jugador ?y - objeto ?z - zona) ;hay un jugador y un objeto en una zona
    :precondition (and (jugador_tiene_objeto ?x ?y) (posicion_jugador ?x ?z)) ;el jugador tiene el objeto y está en la zona z
    :effect
    (and
      (not (jugador_tiene_objeto ?x ?y)) ;el jugador ya no tiene el objeto
      (jugador_sin_objeto ?x)
      (posicion_objeto ?y ?z) ;el objeto está en la zona z
    )
  )

  (:action jugador_coge_objeto
    :parameters (?x - jugador ?y - objeto ?z - zona) ;hay un jugador y un objeto en una zona
    :precondition (and (jugador_sin_objeto ?x) (posicion_jugador ?x ?z) (posicion_objeto ?y ?z)) ;el jugador tiene las manos vacías y está en la misma zona que el objeto
    :effect
    (and
      (not (jugador_sin_objeto ?x)) ;el jugador ya no tiene las manos vacías
      (not (posicion_objeto ?y ?z)) ;el objeto ya no está en la zona
      (jugador_tiene_objeto ?x ?y) ;el jugador tiene el objeto
    )
  )

  (:action girar_derecha
    :parameters (?x - jugador) ;hay un jugador
    :effect
    (and
      (when (direccion_jugador ?x norte) (and (not (direccion_jugador ?x norte)) (direccion_jugador ?x este))) ;si está mirando al norte, mira al este
      (when (direccion_jugador ?x este) (and (not (direccion_jugador ?x este)) (direccion_jugador ?x sur))) ;si está mirando al este, mira al sur
      (when (direccion_jugador ?x sur) (and (not (direccion_jugador ?x sur)) (direccion_jugador ?x oeste))) ;si está mirando al sur, mira al oeste
      (when (direccion_jugador ?x oeste) (and (not (direccion_jugador ?x oeste)) (direccion_jugador ?x norte)))  ;si está mirando al oeste, mira al norte
    )
  )

  (:action girar_izquierda
    :parameters (?x - jugador) ;hay un jugador
    :effect
    (and
      (when (direccion_jugador ?x norte) (and (not (direccion_jugador ?x norte)) (direccion_jugador ?x oeste))) ;si está mirando al norte, mira al oeste
      (when (direccion_jugador ?x este) (and (not (direccion_jugador ?x este)) (direccion_jugador ?x norte))) ;si está mirando al este, mira al norte
      (when (direccion_jugador ?x sur) (and (not (direccion_jugador ?x sur)) (direccion_jugador ?x este))) ;si está mirando al sur, mira al este
      (when (direccion_jugador ?x oeste) (and (not (direccion_jugador ?x oeste)) (direccion_jugador ?x sur))) ;si está mirando al oeste, mira al sur
    )
  )

)
