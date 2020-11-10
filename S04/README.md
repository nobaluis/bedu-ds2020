# Evidencias - Sesion 04

`Autor: Luis Castillo`

## Reto 01

**Q:** Fecha, nombre y texto de cada comentario

```
{
 project: {
  _id: 0,
  date: 1,
  name: 1,
  text: 1
 }
}
```



**Q:** Título, elenco y año de cada película

```
{
 project: {
  _id: 0,
  title: 1,
  cast: 1,
  year: 1
 }
}
```



**Q:**  Nombre y contraseña de cada usuario

``` 
{
 project: {
  _id: 0,
  name: 1,
  password: 1
 }
}
```



## Reto 02

**Q:** ¿Qué comentarios ha hecho Greg Powell?

``` 
{
 filter: {
  name: 'Greg Powell'
 }
}
```



**Q:** ¿Qué comentarios han hecho Greg Powell o Mercedes Tyler?

```
{
 filter: {
  $or: [
   {
    name: 'Greg Powell'
   },
   {
    name: 'Mercedes Tyler'
   }
  ]
 }
}
```

o

```
{
 filter: {
  name: {
   $in: [
    'Greg Powell',
    'Mercedes Tyler'
   ]
  }
 }
}
```



**Q:** ¿Cuál es el máximo número de comentarios en una película?

``` 
{
 project: {
  num_mflix_comments: 1
 },
 sort: {
  num_mflix_comments: -1
 },
 limit: 1
}
```



**Q:** ¿Cuál es título de las cinco películas más comentadas?

``` 
{
 project: {
  title: 1
 },
 sort: {
  num_mflix_comments: -1
 },
 limit: 5
}
```