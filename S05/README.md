# Evidencias - Sesion 05

`Autor: Luis Castillo`

## Reto 01

**Q:** Propiedades que no permitan fiestas.

```
{
 filter: {
  house_rules: RegExp('no parties', i)
 }
}
```



**Q:** Propiedades que admitan mascotas.

```
{
 filter: {
  house_rules: RegExp('pets allowed', i)
 }
}
```



**Q:** Propiedades que no permitan fumadores.

```
{
 filter: {
  house_rules: RegExp('no smok', i)
 }
}
```

*Nota: Utilizo `smok` para abarcar los casos de "no smoke" y "no smoking"



**Q:** Propiedades que no permitan fiestas ni fumadores.

```
{
 filter: {
  house_rules: {
   $in: [
    RegExp('no parties', i),
    RegExp('no smok', i)
   ]
  }
 }
}
```



## Reto 02

**Q**: Usando la colección `sample_airbnb.listingsAndReviews`,  agrega un filtro que permita obtener todas las publicaciones que tengan  50 o más comentarios, que la valoración sea mayor o igual a 80, que  cuenten con conexión a Internet vía cable y estén ubicada en Brazil.

```
{
 filter: {
  number_of_reviews: {
   $gte: 50
  },
  'review_scores.review_scores_rating': {
   $gte: 80
  },
  amenities: {
   $in: [
    'Ethernet connection'
   ]
  },
  'address.country': 'Brazil'
 }
}
```



## Reto 03

**Q:** Usando la colección `sample_airbnb.listingsAndReviews`,  mediante el uso de agregaciones, encontrar el número de publicaciones  que tienen conexión a Internet, sea desde Wifi o desde cable (Ethernet).



Para resolverlo utilice dos stages utilizando `$match` y después `$count`. Utilizando la función *export pipline* de MongoDB Compass, la respuesta es:

```
[{$match: {
  amenities: {$in: ["Internet","Ethernet conenction", "Wifi"]}
}}, {$count: 'total'}]
```

