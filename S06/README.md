# Evidencias - Sesion 06

`Autor: Luis Castillo`

## Reto 01

**Q:** Con base en el ejemplo 1, modifica el agrupamiento para que muestre el costo promedio por habitación por país de las propiedades de tipo casa.

```
[{$match: {
  property_type: "House",
  bedrooms: {$gte: 1}
}}, {$addFields: {
  room_price: {$divide: ["$price", "$bedrooms"]} 
}}, {$group: {
  _id: "$address.country",
  avg_price: {$avg: "$room_price"}
}}, {$addFields: {
  country: "$_id",
  avg_price: {$round: ["$avg_price", 2]}
}}, {$project: {
  _id: 0,
  country: 1,
  avg_price: 1
}}]
```



## Reto 02

**Q: **Usando las colecciones `comments` y `users`, se  requiere conocer el correo y contraseña de cada persona que realizó un  comentario. Construye un pipeline que genere como resultado estos datos.

```
[{$lookup: {
  from: 'users',
  localField: 'email',
  foreignField: 'email',
  as: 'user'
}}, {$addFields: {
  user_doc: {$arrayElemAt: ["$user", 0]}
}}, {$addFields: {
  password: "$user_doc.password"
}}, {$project: {
  _id: 0,
  email: 1,
  password: 1,
  name: 1
}}]
```

