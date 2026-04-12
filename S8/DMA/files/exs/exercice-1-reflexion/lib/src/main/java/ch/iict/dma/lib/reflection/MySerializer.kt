package ch.iict.dma.lib.reflection

import org.json.JSONObject
import kotlin.reflect.KClass
import kotlin.reflect.KMutableProperty
import kotlin.reflect.KVisibility
import kotlin.reflect.full.primaryConstructor
class MySerializer {

    companion object {

        fun serialize(objet : Any) : String {

            val classe = objet::class // on détermine la classe de l'objet à sérialiser
            val json = JSONObject() // on créée un objet json "vide"

            // on parcourt toutes les propriétés visibles de la classe
            classe.members
                .filter { it.visibility == KVisibility.PUBLIC }
                .filterIsInstance<KMutableProperty<*>>()
                .forEach { prop ->

                    // TODO remplissage de l'objet json avec les propriétés de la classe
                    // certains types nécessitent un traitement particulier, on se limitera
                    // dans cet exercice aux types simples (String, int, double, float) ainsi
                    // qu'au type particulier Date. Nous n'allons pas mettre en place de recursion

                    val value = prop.getter.call(objet)
                    val jsonValue = when (value) {
                        null -> JSONObject.NULL
                        is String, is Int, is Double, is Float -> value
                        is java.util.Date -> value.time
                        else -> throw IllegalArgumentException("Unsupported type for property '${prop.name}': ${value::class}")
                    }

                    // put ecrase la cle si elle existe deja, contrairement a accumulate qui cree un tableau
                    json.put(prop.name, jsonValue)

                }

            return json.toString(1)
        }

        fun <A: Any> deserialize(json : String, classe : KClass<A>) : A {

            // on parse le json représentant l'objet
            val data = JSONObject(json)

            // on se limite aux data classes
            if(!classe.isData)
                throw java.lang.IllegalArgumentException("Only data class can be deserialized")

            // TODO il s'agit ici de récupérer une référence vers le constructeur par défaut de la
            // data classe et de parcourir la liste de ses paramètres. Pour chaque paramètre, nous
            // remplirons, dans l'ordre, un Tableau<Any> avec la valeur correspondante au nom du
            // paramètre extraite du json. Le type des objets placé dans le tableau doit correspondre
            // aux types attendus dans le constructeur. Certains types doivent subir un traitement
            // particulier pour les convertir dans le bon type, par exemple les Dates. Pas de recursion
            // dans le cadre de cet exercice

            // return l'objet instancié
            val constructor = classe.primaryConstructor
                ?: throw java.lang.Exception("No constructor found for class $classe")

            val args = constructor.parameters.map<kotlin.reflect.KParameter, Any?> { param ->
                val name = param.name
                    ?: throw java.lang.Exception("Unnamed constructor parameter in $classe")

                if (!data.has(name) || data.isNull(name)) {
                    throw java.lang.Exception("Missing required field '$name' for class $classe")
                }

                val rawValue = data.get(name)
                when (param.type.classifier) {
                    String::class -> rawValue.toString()
                    Int::class -> (rawValue as? Number)?.toInt()
                        ?: rawValue.toString().toIntOrNull()
                        ?: throw java.lang.Exception("Invalid Int value for '$name': $rawValue")
                    Double::class -> (rawValue as? Number)?.toDouble()
                        ?: rawValue.toString().toDoubleOrNull()
                        ?: throw java.lang.Exception("Invalid Double value for '$name': $rawValue")
                    Float::class -> (rawValue as? Number)?.toFloat()
                        ?: rawValue.toString().toFloatOrNull()
                        ?: throw java.lang.Exception("Invalid Float value for '$name': $rawValue")
                    java.util.Date::class -> {
                        val timestamp = (rawValue as? Number)?.toLong()
                            ?: rawValue.toString().toLongOrNull()
                            ?: throw java.lang.Exception("Invalid Date value for '$name': $rawValue")
                        java.util.Date(timestamp)
                    }
                    else -> throw java.lang.Exception("Unsupported parameter type: ${param.type}")
                }
            }.toTypedArray()

            return constructor.call(*args)
        }

    }

}