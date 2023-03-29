
import SwiftUI

class ActivitiesMockStore {
    
    static let activities: [ActivitiesItem] = [
        ActivitiesItem(id: 0, activityName: "SOCIAL", activityNameLabel: "Social", activityImage: "comida3", selectedActivity: false),
        ActivitiesItem(id: 1, activityName: "TEXTURAS", activityNameLabel: "Texturas", activityImage: "comida", selectedActivity: false),
        ActivitiesItem(id: 2, activityName: "DÍA A DÍA", activityNameLabel: "Día a día", activityImage: "ataque", selectedActivity: false)
    ]
    
    
    
    static let activityData: [ActivitiesData] = [
        
        ActivitiesData(id: 0, activitiesPlaces:
            [ActivitiesPlaces(id: 0, activityPlace: "Indirectas", activityPlaceImage: "comida", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Hipotético", pointImage: "comida", pointDescription: "Las situaciones hipotéticas no existen dentro de la mente autista. La mayoría de los ejemplos, así como historias pueden llegar a tomarse en cuestiones literales. Es por esto por lo que es mejor el explicar no desde la imaginación sino desde ejemplos prácticos o casos reales."),
                                                                                                                       
            ActivitiesFamousPoints(id: 1, pointName: "Relaciones", pointImage: "comida3", pointDescription: "Como todo ser humano, los autistas poseen relaciones familiares, de amistad e incluso de pareja, sin embargo, estas llegan a ser diferentes. Debido a los diferentes tratos que posee el autista. Con cada persona puede relacionarse de manera completamente diferente e incluso con muchas personas puede hacer algo llamado “masking”."),
            
            ActivitiesFamousPoints(id: 2, pointName: "Literal…", pointImage: "acomodo", pointDescription: "Todos los contextos serán literales, por ello tanto indirectas como situaciones las cuales sean obvias o de sentido común para los autistas no lo será. Esto no refleja que no pueden crear conexiones o relacionar cosas, si no que les es más difícil hacerlo cuando es algo relacionado a constructos sociales.")
            ]),
             
             ActivitiesPlaces(id: 1, activityPlace: "Limites", activityPlaceImage: "ataque", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Físicos", pointImage: "cabmbio", pointDescription: "Aunque a la mayoría de las personas les gusten los abrazos, esto no significa que con todos sea así. Los autistas pueden tener límites muy específicos con cada una de las personas que lo rodea e incluso puede llegar a tener no solo limites, si no necesidades físicas dependiendo la relación que tenga con cada persona, esto también puede estar relacionado a la limpieza."),
             
                 ActivitiesFamousPoints(id: 1, pointName: "Contexto", pointImage: "comida2", pointDescription: "Para lo que muchas personas les parezca algo incorrecto o poco moral, para los autistas puede no significar gran cosa. Esto debido a que muchos limites los cuales la mayoría de las personas generamos gracias a los contextos sociales, ellos no. Y los crean a partir de experiencias las cuales lastimosamente suelen ser desagradables.")
             ]),
             
             ActivitiesPlaces(id: 2, activityPlace: "Empatía", activityPlaceImage: "comida3", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "No entiendo", pointImage: "capetown", pointDescription: "Muchas de las situaciones sociales no las podrá entender un autista, y esto es completamente normal, debido a que su sentir no puede nacer de situaciones hipotéticas, solo de situaciones empíricas. Todo debió haber sido aprendido con anterioridad o con sustentos. Sin embargo, esto no significa que no posean empatía, y este es una de las principales creencias que han crecido relacionadas a la desinformación."),
                 
                  ActivitiesFamousPoints(id: 1, pointName: "Emociones", pointImage: "comida4", pointDescription: "Muchas de las situaciones sociales no las podrá entender un autista, y esto es completamente normal, debido a que su sentir no puede nacer de situaciones hipotéticas, solo de situaciones empíricas. Todo debió haber sido aprendido con anterioridad o con sustentos. Sin embargo, esto no significa que no posean empatía, y este es una de las principales creencias que han crecido relacionadas a la desinformación. ")
             ])],
                      
            activityResources:
        
            [ActivityResource(id: 0, resourceName: "¿Cómo ayudar?", resourceDescription: "Que hacer para poder apoyar a una persona autista en estos temas", resources:
                [ActivityResourcesItem(id: 0, resourceName: "Pregunta si hay muchos estimulos en el lugar", resourceImage: "contexto", resourceDescription: "Article"),
                 ActivityResourcesItem(id: 1, resourceName: "Pregunta los limites que tiene la persona", resourceImage: "dia", resourceDescription: "Article"),
                 ActivityResourcesItem(id: 2, resourceName: "Si se encuentra en un ataque debido al ambiente, muevanse a otra zona", resourceImage: "discapacitado3", resourceDescription: "Tutorial")]),
                
                ActivityResource(id: 1, resourceName: "¿Qué entender?", resourceDescription: "Que cosas debemos entender y reflexionar un poco con respecto a las personas neuro diversas", resources: [ActivityResourcesItem(id: 1, resourceName: "No entenderá indirectas", resourceImage: "dolor", resourceDescription: ""),
                     ActivityResourcesItem(id: 2, resourceName: "No esperes reacciones especificas", resourceImage: "dolor", resourceDescription: ""),
                     ActivityResourcesItem(id: 3, resourceName: "Los autistas si tiene empatía", resourceImage: "emociones", resourceDescription: "")]),
                
                ActivityResource(id: 2, resourceName: "Palabras clave", resourceDescription: "Palabras clave del tema para mejorar la comunicación entre personas dentro del espectro", resources: [ActivityResourcesItem(id: 1, resourceName: "Estímulos", resourceImage: "empatia", resourceDescription: "Video"),
                     ActivityResourcesItem(id: 2, resourceName: "Contexto", resourceImage: "enfermo", resourceDescription: "Camp"),
                     ActivityResourcesItem(id: 3, resourceName: "Limites", resourceImage: "entender1", resourceDescription: "Photography")])
                ]),
       
        ActivitiesData(id: 1, activitiesPlaces: [
        
            ActivitiesPlaces(id: 1, activityPlace: "Personas", activityPlaceImage: "esperar", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Personas", pointImage: "estimulos", pointDescription: "Las personas pueden ocasionar problemas en el aspecto físico. Ya se los fluidos corporales, la textura de la piel o incluso la textura de la ropa que está usando esa persona puede hacer que la persona neurodivergente siente un asco, ansiedad o incluso un dolor el cual puede llevar a ataques de pánico o incluso convulsiones.")]),
            ActivitiesPlaces(id: 2, activityPlace: "Comida", activityPlaceImage: "estimulostexturas", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Comida", pointImage: "exigir", pointDescription: "La comida es uno de los temas más importantes que debemos tratar en la neuro diversidad, debido a que una de las principales causas de muerte está relacionadas con enfermedades alimenticias, como la obesidad o incluso la anorexia. Esto debido a que no pueden controlar la cantidad de comida que ingieren, pueden tener una dieta bastante pobre en nutrientes o incluso las texturas de la misma comida les impida ingerirlas.")]),
            ActivitiesPlaces(id: 3, activityPlace: "Ropa", activityPlaceImage: "fiesta", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Ropa", pointImage: "fisico", pointDescription: "Aunque parezca poco creíble, la ropa juega un papel fundamental en el día a día de las personas autistas. Puede ser un martirio completo el tener ropa que no sea cómoda debido a la textura, colores o incluso los dibujos o patrones que tenga. Es fundamental para un autista el seleccionar su ropa tomando una serie especifica de criterios.")])],
                      
                      
            activityResources:
       
           [ActivityResource(id: 0, resourceName: "¿Cómo ayudar?", resourceDescription: "Que hacer para poder apoyar a una persona autista en estos temas", resources:
               [ActivityResourcesItem(id: 0, resourceName: "Comprender si la persona no puede comer ciertas comidas", resourceImage: "hipotetico", resourceDescription: "Article"),
                ActivityResourcesItem(id: 1, resourceName: "Puedes preguntar las comidas seguras que posee la persona", resourceImage: "indirectas", resourceDescription: "Article"),
                ActivityResourcesItem(id: 2, resourceName: "No tengas contacto físico con la persona, primero pregunta", resourceImage: "limites", resourceDescription: "Guide")]),
               
               ActivityResource(id: 1, resourceName: "¿Qué entender?", resourceDescription: "Que cosas debemos entender y reflexionar un poco con respecto a las personas neuro diversas", resources: [ActivityResourcesItem(id: 1, resourceName: "Hay comidas que no podrá comer", resourceImage: "literal", resourceDescription: ""),
                    ActivityResourcesItem(id: 2, resourceName: "Hay ropa que puede incomodar a la persona", resourceImage: "luces", resourceDescription: ""),
                    ActivityResourcesItem(id: 3, resourceName: "La piel, el sudor y cualquier objeto físico puede ocasionar un problema", resourceImage: "nopoder", resourceDescription: "")]),
               
               ActivityResource(id: 2, resourceName: "Palabras clave", resourceDescription: "Palabras clave del tema para mejorar la comunicación entre personas dentro del espectro", resources: [ActivityResourcesItem(id: 1, resourceName: "Problemas sensoriales", resourceImage: "nopoder2", resourceDescription: "Video"),
                    ActivityResourcesItem(id: 2, resourceName: "Contacto", resourceImage: "orden", resourceDescription: "Camp"),
                    ActivityResourcesItem(id: 3, resourceName: "Preferencias", resourceImage: "orden2", resourceDescription: "Photography")])
               ]),
       
       
        ActivitiesData(id: 2, activitiesPlaces: [
        
            ActivitiesPlaces(id: 1, activityPlace: "Problemas sensoriales", activityPlaceImage: "paciencia3", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Luces", pointImage: "paciente", pointDescription: "Todo puede traer problemas sensoriales, desde el contacto físico, comida, ropa e incluso el clima. Por eso es importante saber si la persona se siente cómoda en el espacio que se encuentra."),
            
                ActivitiesFamousPoints(id: 1, pointName: "Sonidos", pointImage: "preferencia", pointDescription: "No a todas las personas autistas les pasa esto, pero es importante el saberlo. Muchos sonidos molestos, fuertes o incluso constantes puedes afectar el pensar así como el comportamiento de la persona, al punto que puede entrar a un estado de crisis absoluto en el cual puede hacerse daño así mismo. ")
            ]),
            
            ActivitiesPlaces(id: 2, activityPlace: "Orden", activityPlaceImage: "pregunta", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "Gustos específicos", pointImage: "problemas", pointDescription: "Esta es una de las características que más se refleja en menores de edad, muchas personas a temprana edad juegan a partir del orden. Ya sea organizando por tamaño, color o categoría, pero esto deja de ser un simple juego en la vida adulta. Muchas de las ocasiones es necesario tener un orden para poder iniciar, seguir o incluso terminar una tarea."),
                
                ActivitiesFamousPoints(id: 1, pointName: "Acomodo de las cosas", pointImage: "problemas2", pointDescription: "En ocasiones las listas son un recurso necesario para la vida de un autista. Sin estas, pueden sentirse perdidos, en un espacio en el cual no solo se sientan inseguros, si no que no podrán hacer nada durante el día al menos que conozcan a detalles que es lo que harán a determinada hora.")
            
            ]),
            ActivitiesPlaces(id: 3, activityPlace: "El trastorno", activityPlaceImage: "relaciones", famousPointsArray: [ActivitiesFamousPoints(id: 0, pointName: "No hay una cura", pointImage: "ropa", pointDescription: "No existe una cura debido a que no es una enfermedad. El termino de espectro o trastorno no recae meramente en una enfermedad. Si no que se encuentra más ligada a cuestiones como la discapacidad o una diversidad diferente a la típica."),
                  
                ActivitiesFamousPoints(id: 1, pointName: "Adaptarse", pointImage: "ropapeluda", pointDescription: "Los cambios pueden ser sumamente difíciles para las personas autistas. Algo que una persona neurotípica puede entender y modificar en cuestión de minutos un autista puede llegar a tardar días en procesar todo lo que ocurre a su alrededor. Desde emociones, costumbre o hasta comportamientos sociales están ligados a esto.  ")

            ])],
                      
                      
            activityResources:
       
           [ActivityResource(id: 0, resourceName: "¿Cómo ayudar?", resourceDescription: "Que hacer para poder apoyar a una persona autista en estos temas", resources:
               [ActivityResourcesItem(id: 0, resourceName: "No exijas cambios instantáneos", resourceImage: "saludocontacto", resourceDescription: "Article"),
                ActivityResourcesItem(id: 1, resourceName: "Se paciente con el entendimiento de los cambios", resourceImage: "capetown", resourceDescription: "Article"),
                ActivityResourcesItem(id: 2, resourceName: "Entiende que hay cosas que no pueden hacer", resourceImage: "saludocontacto", resourceDescription: "Fun")]),
               
               ActivityResource(id: 1, resourceName: "¿Qué entender?", resourceDescription: "Que cosas debemos entender y reflexionar un poco con respecto a las personas neuro diversas", resources: [ActivityResourcesItem(id: 1, resourceName: "Hay lugares en los que no pueden estar", resourceImage: "saludocontacto", resourceDescription: ""),
                    ActivityResourcesItem(id: 2, resourceName: "No tienen las mismas capacidades que tú", resourceImage: "saludocontacto", resourceDescription: ""),
                    ActivityResourcesItem(id: 3, resourceName: "Es una discapacidad", resourceImage: "saludocontacto", resourceDescription: "")]),
               
               ActivityResource(id: 2, resourceName: "Palabras clave", resourceDescription: "Palabras clave del tema para mejorar la comunicación entre personas dentro del espectro", resources: [ActivityResourcesItem(id: 1, resourceName: "Discapacidad", resourceImage: "saludocontacto", resourceDescription: "Video"),
                    ActivityResourcesItem(id: 2, resourceName: "Paciencia", resourceImage: "ropapeluda", resourceDescription: "Tutorial"),
                    ActivityResourcesItem(id: 3, resourceName: "Los cambios son dolorosos", resourceImage: "ropapeluda", resourceDescription: "Photography")])
               ])
       
    ]
    
    static let shoppingCartData: [ActivitiesCartItem] = [
           ActivitiesCartItem(itemID: "1", itemName: "Snow board", itemPrice: 450, itemColor: "Red", itemManufacturer: "Elan Explore", itemImage: "snowboardred"),
           ActivitiesCartItem(itemID: "2", itemName: "Camping Tent", itemPrice: 235, itemColor: "Yellow", itemManufacturer: "Explorers", itemImage: "campingtent"),
           ActivitiesCartItem(itemID: "3", itemName: "Surf board", itemPrice: 825, itemColor: "Black", itemManufacturer: "WaveExplore", itemImage: "surfboard")
       ]
    
}
