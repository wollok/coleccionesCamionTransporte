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


## Agregados al camión
Se pide agregar estos mensajes al camión:

* `tieneAlgoQuePesaEntre(min, max)`: indica si el peso de alguna de las cosas que tiene el camión está en ese intervalo;
* `cosaMasPesada()`: la cosa más pesada que tenga el camión. Ojo que lo que se pide es _la cosa_ y no su peso.
* `pesos()`: devuelve una lista con _los pesos_ de cada cosa que tiene el camión.
* `totalBultos()`: la suma de la cantidad de bultos que está transportando.
  - KnightRider, arena a granel y residuos radioactivos usan 1 bulto cada uno.
  - Bumblebee y embalaje de seguridad usan dos bultos cada uno.
  - Paquete de ladrillos usa 1 bulto hasta 100 ladrillos, 2 bultos si son de 101 a 300 ladrillos, 3 bultos si son 301 o más ladrillos.
  - Batería antiaérea: usa 1 bulto si no tiene misiles, 2 si tiene.
  - Contenedor portuario: usa 1 bulto más de la cantidad de bultos que usan las cosas que tiene adentro.

## Consecuencias de la carga.
Agregar la posibilidad de que al cargar una cosa en el camión, esta pueda sufrir cambios. Estos cambios tienen que ocurrir automáticamente cuando, por ejemplo, se ejecuta `camion.cargar(arenaGranel)`. Cómo debería reaccionar cada cosa:

- KnightRider: no hace nada;
- Bumblebee: pasa a robot;
- paquete de ladrillos: agrega 12 ladrillos;
- arena a granel: agrega 20 kilos;
- batería antiaérea: carga misiles;
- contenedor portuario: hace que reaccione cada una de las cosas que tiene adentro;
- residuos radioactivos: agrega 15 kilos;
- embalaje de seguridad: nada.

## Transporte.

El camión de transporte transporta los elementos al almacén. Al rllegar al almacén, todas las cosas que están en el camión pasan al almacén: 
Por ejemplo, si el camión tiene a Knight Rider y a Bumblebee, mientras que  el almacén está la arena a granel, cuando el camión 
llega éste queda vacío y en el almacén quedan bumblebee, arena a grandel y Knight Rider.

El viaje puede ser por la ruta 9 o por caminos vecinales. Esta elección se hace al momento de realizar el transporte.

Para que el transporte pueda ser realizado debe cumplirse con las siguientes condiciones:
* El camión no tiene que estar excedido de peso
* El almacén tiene una cantidad de bultos máximos que no puede superar. Por ejemplo, si contiene arena a granel (1 bulto), el máximo de bultos
del almacén se configura en 3, y el camión contiene a Bumblebee y Knight Rider (3 bultos), entonces no se puede transportar.
* El camino soporte el viaje:
	* El nivel de peligrosidad de la ruta 9 es 11, solo se puede usar la ruta 9 en los casos en "puedaCircularEnRuta" del punto 1
	* Los caminos vecinales tienen un peso máximo soportado que es configurable. El peso total del camión no puede ser superior al peso tolerado


Se pide que el camión entienda el mensaje `transportar(destino, camino)` Donde destino es el almacén (pero se parametriza porque podría
aparecer otros lugares) y el camino es una de las dos opciones (ruta 9 o caminos vecinales, pero también se debe pensar que pueda haber otros caminos
polimórficos.

Es importante realizar las validaciones correspondientes.






 




