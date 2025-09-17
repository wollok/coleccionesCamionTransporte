# Camión de transporte

Una empresa de transporte quiere administrar mejor las cargas que lleva un camión.

Para eso requiere un sistema que le permita planificar qué cosas debe llevar el camión sin sobrepasar su capacidad a un destino capaz de recibir la carga. Por otro lado, las cosas que transporta tienen un nivel de peligrosidad. Este nivel es usado para impedir que cosas que superen cierto nivel de peligrosidad circulen en determinadas rutas.

## Las cosas
De las cosas que puede transportar el camión nos interesa el peso y la peligrosidad:
Éstas son algunas de las cosas:

* Knight Rider: pesa 500 kilos y su nivel de peligrosidad es 10.
* Arena a granel: el peso es variable, la peligrosidad es 1.
* Bumblebee: pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado en auto o 30 si está como robot.
* Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. La peligrosidad es 2.
* Batería antiaérea : el peso es 300 kilos si está con los misiles o 200 en otro caso. En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso.
* Residuos radioactivos: el peso es variable y su peligrosidad es 200.


## El camión
Se pide que modelar un camión que transporta cosas que soporte los siguientes requerimientos:

### Carga y descarga
Poder cargar una cosa, y también descargar una cosa. 
No se puede cargar algo ya cargado ni descargar lo que no contiene el camion

#### Ejemplo
- A un camión descargado se le carga bumblebee.
- Asegurarse que en las cosas cargadas sólo esté bumblebee
- Cargar ahora a knight rider
- Asegurarse que las cosas cargadas son bumblebee y  knight rider
- Descargar a bumblebee
- Asegurarse que en las cosas cargadas sólo está son  knight rider
- intentar cargar a knight rider, no se puede porque ya está cargado
- intentar descargar a bumblebee, no se puede porque no estaba cargado

### Todo peso par
Saber si el peso de cada uno de los objetos cargados es un número par.

### Ejemplo
 - para un camion cargado con bumblebee y 50 kg de arena granel todo peso es par
 - en cambio si la arena a granel pesa 51 kg entonces no.

### Hay Alguno que pesa 
Saber si el camion tiene alguna cosa que pesa exactamente una cantidad de kilgramos dada.

#### Ejemplo
para un camion cargado con bumblebee y 50 kg de arena granel:
- Si se pregunta si hay algo que pesa 50 debe contestar que sí (es verdadero, por arena )
- Si se pregunta si hay algo que pesa 800 debe contestar que sí (es verdadero, por bumblebee)
- Si se pregunta si hay algo que pesa 500 debe contestar que no (es falso, ninguno pesa eso)

### Peso y exceso de peso

Saber si el peso total del camión, que es la es la suma del peso del camión vacío (tara) y su carga. La tara del camión es de 1000 kilos.

El camión se encuentra excedido de peso si el peso total es superior al peso máximo aceptable, que es de 2500 kilos.

### Ejemplo

Si el camion tiene a bumblebee y un paquete de 300 ladrillos, entonces el peso total es 2400 y no está excedido de peso. Pero si el paquete de ladrillos contiene 400 ladrillos, entonces el peso total es 2600 y sí está excedido

### El de nivel

Encontrar una cosa cargada cuyo nivel de peligrosidad coincida exactamente con el valor indicado.

#### Ejemplo

Para un camion cargado con bumblebee en modo auto, la batería aérea descargada y un los residuos radiactivos: 

- Si se pide algo de nivel  0 debe encontrar a la batería antiaérea
- Si se pide algo de nivel 15 debe encontrar a bumblebee
- Si se pide algo de nivel 200 debe encontrar a los residuos
- si se pide algo de nivel 30 debe romper, porque no se encuentra nada
- Si se cambia bumblebee a modo robot y se vuelve a pedir algo de 30, entonces encuentra a bumblebee
- Si se carga la batería con misiles y se pide algo de peligrosidad 100 entonces encuentra a la batería


### Cosas peligrosas

Saber:
 - cosas cargadas que estén en el camión que superen cierto nivel de peligrosidad
 - cosas cargadas que estén en el camión que sean más peligrosas que otra cosa indicada.
 - Si 
Tip: buscá reutilizar el código:

#### Ejemplo:
Para un camion cargado con knight rider y la batería aérea cargada 

- En las cosas más peligrosas de 15 sólo está la batería aérea
- En las cosas más peligrosas que bumblebee sólo está la batería aérea
- Las cosas que superan 2 de peligrosidad son  knight rider y la batería aérea descargada 
- Las cosas más peligrosas que el paquete de ladrillo son knight rider y la batería aérea descargada
- No hay cosas más peligrosas que 200
- No hay nada más peligroso que los residuos radiactivos

### Puede circular en ruta
 Saber si el camión puede circular en ruta, lo que ocurra si no está excedido de peso, y además, ninguno de los objetos cargados supera el nivel máximo de peligrosidad indicado.

#### Ejemplos:
- Si el camion tiene a bumblebee en auto y un paquete de 300 ladrillos, puede circular en una ruta con nivel 20.
- Pero el camion tiene  el paquete de 400 ladrillos y bumblebee en modo auto ya no puede circular en la ruta de nivel 20, por estar excedido de peso
- Tampoco puede circular en una ruta de nivel 20 si tiene un paquete de 300 ladrillos y bumblebee está en modo robot

### Más Cosas:
Agregar las siguientes cosas para ser transportadas por el camión:

* Contenedor portuario: un contenedor puede tener otras cosas adentro. El peso es 100 + la suma de todas las cosas que estén adentro. Es tan peligroso como el objeto más peligroso que contiene. Si está vacío, su peligrosidad es 0.
* Embalaje de seguridad: es una cobertura que envuelve a cualquier otra cosa. El peso es el peso de la cosa que tenga adentro. El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.

### Ejemplos
  - el contendor portuario vacío pesa 100 y su peligrosidad es 0
  - el contenedor portuario que tiene a knight rider y 50 kg de arena a granel pesa 650 y su peligrosidad es 10
  - si el embalaje de seguridad envuelve a los knight rider, su peso es 500 y su peligrisidad es 5
  - si el embalaje de seguridad envuelve a bumblebee en modo auto su peso es 800 y su peligrisdad 7.5


### tiene algo que pesa entre dos valores

Saber si el camion tiene algo que pesa entre dos valores (mínimo y máximo)

#### Ejemplo
Para un camion cargado con bumblebee y un paquete de 300 ladrillos:
-  tiene algo que que pesa entre 5 y 100
-  tiene algo que pesa entre 5 y 1000
-  no tiene algo que pesa entre 900 y 1000

### Cosa más pesada
 la cosa más pesada que tenga el camión. Ojo que lo que se pide es _la cosa_ y no su peso.

#### Ejemplo
  - Para un camion cargado con bumblebee y un paquete de 300 ladrillos, la cosa más pesada es bumblebee
  - Para un camion vacío, no se puede calcular la cosa más pesada

### pesos
Saber todos los pesos de las cosas que tiene el camión.

#### Ejemplo
  - Para un camion cargado con bumblebee y un paquete de 300 ladrillos, los pesos son 800 y 600 
  Nota: ojo al armar el test, porque para wollok [800,600] es distinto a [600,800]. A nivel de negocio da igual

### TodalBultos
Cada cosa se puede transportar en uno o más bultos, dependiendo de la cosa en sí:

  - KnightRider, arena a granel y residuos radioactivos usan 1 bulto cada uno.
  - Bumblebee y embalaje de seguridad usan dos bultos cada uno.
  - Paquete de ladrillos usa 1 bulto hasta 100 ladrillos, 2 bultos si son de 101 a 300 ladrillos, 3 bultos si son 301 o más ladrillos.
  - Batería antiaérea: usa 1 bulto si no tiene misiles, 2 si tiene.
  - Contenedor portuario: usa 1 bulto más de la cantidad de bultos que usan las cosas que tiene adentro.

Se pide saber la cantidad total de bultos que está transportando el camion.

#### Ejemplos

##### Caso 1
 Suponiendo que el camion tiene:
 - el contenedor portuario con knightRider y bumblebee
 - el embalaje de seguridad está envolviendo los residuos radiactivos
 - arena a granel
 - un paquete de 50 ladrillos
 - la batería antiaérea descargada
  Entonces la cantidad de bultos es: 9

##### Caso 2

Si el camion tiene:
  -un paquete de 150 ladrillos 
  -la bateria antiaérea cargada
  -un contendeor portuario vacío
  Entonces la cantidad de butlos es 5

##### Caso 3

Si el camion tiene 
 - un paquete de 350 ladrillos
 - arena a granel
 Entonces la cantidad de bultos es 4

### Accidente

Si el camión sufre un accidente, las cosas que está transportando sufren algún efecto

Éstas son los efectos para cada cosa al accidentarse el camión:

- KnightRider: no hace nada;
- Bumblebee: cambia  de modo robot (si estaba en robot pasa a auto y viceversa);
- paquete de ladrillos: pierde hasta 12 ladrillos. Si tenía menos de 12 queda en 0;
- arena a granel: agrega 20 kilos;
- batería antiaérea: descarga los misiles;
- contenedor portuario: hace que reaccione cada una de las cosas que tiene adentro (por ejemplo, si llevaba a bumblebee, éste queda en modo robot);
- residuos radioactivos: agrega 15 kilos;
- embalaje de seguridad: nada.

Se pide modelar que un camión sufre un accidente, aplicando los efectos a las cosas cargadas

#### Ejemplos

##### Caso 1

Suponiendo que el camion tiene:
 - el contenedor portuario con knightRider y bumblebee en modo auto
 - el embalaje de seguridad está envolviendo 30 kg residuos radiactivos 
 - 50 kg de arena a granel
 - un paquete de 100 ladrillos
 - la batería antiaérea cargada

Al producirse un accidente:
- bumblebee queda en modo robot
- residuos radiactivos queda con 30kg de pesos
- la arena queda con 70 kg
- el paquete de ladrillo queda con 88 ladrillos
- la bateria aerea queda descargada

##### Caso 2

Suponiendo que el camion tiene:
 - bumblebee en modo robot
 - 30 kg residuos radiactivos 
 - un paquete de 10 ladrillos
 - la batería antiaérea descargada

Al producirse un accidente:
- bumblebee queda en modo auto
- residuos radiactivos queda con 45kg de pesos
- el paquete de ladrillo queda con 0 ladrillos
- la bateria aerea queda descargada
  

## Transporte.

El camión transporta los elementos al almacén. Al llegar al almacén, todas las cosas que están en el camión pasan al almacén: El camión queda vacío y el almacen se quedan las cosas que ya tenía más aquellas transportadas por el camión.

Por ejemplo, si el camión tiene a Knight Rider y a Bumblebee, mientras que en el almacén está la arena a granel, cuando el camión llega éste queda vacío y en el almacén quedan bumblebee, arena a grandel y Knight Rider.

El viaje puede ser por la ruta 9 o por caminos vecinales. Esta elección se hace al momento de realizar el transporte.

Para que el transporte pueda ser realizado debe cumplirse con las siguientes condiciones el camino 
debe soportar el viaje:
	* La ruta nueve soporta viajes según el requerimiento "pueda Circular En Ruta" (resulto anteriormente) con un nivel de peligrosidad de 20.
	* Los caminos vecinales soportan viajes de vehículos que no superen el peso máximo permitido, el cual es configurable. 

Se pide que el camión entienda el mensaje `transportar(destino, camino)` Donde destino es el almacén (pero se parametriza porque podría aparecer otros lugares) y el camino es una de las dos opciones (ruta 9 o caminos vecinales, pero también se debe pensar que pueda haber otros caminos polimórficos.

Es importante realizar las validaciones correspondientes.

#### Ejemplo

Para todos los casos, el almacen tiene a Knight rider y residuos radiactivos. 
El camion arranca teniendo a bumblebe en modo auto y arena a granel con 50 kg

#### Caso: ruta 9 exitoso
El camion puede transportar sin problemas por la ruta nueve hacia el almacén. 
En el almacén queda Knight rider, residuos radiactivos, bumblebee y arena a granel.
El camión queda vacío.

#### Caso: ruta 9 fallido por peligrosidad
cambiar el modo de bumblebee a robot. 
El camion no puede transportar por la ruta nueve hacia el almacén (fallará el nivel de peligrosidad). 
En el almacén queda Knight rider y residuos radiactivos.
En el camión quedan bumblebee y arena a granel.
 
#### Caso: ruta 9 fallido por exceso de peso
cambiar el peso de la arena a granel a 2000 kg
El camion no puede transportar por la ruta nueve hacia el almacén (fallará por exceso de peso del camión). 
En el almacén queda Knight rider y residuos radiactivos.
En el camión quedan bumblebee y arena a granel.

#### Caso: caminos vecinales exitoso
Configurar los caminos vecinales con un máximo de 2000 kg de soporte
El camion puede transportar sin problemas por los caminos vecinales hacia el almacén. 
En el almacén queda Knight rider, residuos radiactivos, bumblebee y arena a granel.
El camión queda vacío.

#### Caso: caminos vecinales fallido
Configurar los caminos vecinales con un máximo de 300 kg de soporte
El camion no puede transportar por los caminos vecinales hacia el almacen. 
En el almacén queda Knight rider y residuos radiactivos.
El camión queda vacío.
En el camión quedan bumblebee y arena a granel.




 




