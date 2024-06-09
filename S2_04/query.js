// 1.Mostrar todos los documentos en la colección Restaurantes:
db.restaurants.find()

// 2.Mostrar restaurante_id, name, borough y cuisine para todos los documentos en la colección Restaurantes:
db.restaurants.find({}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 })

// 3.Mostrar restaurante_id, name, borough y cuisine, pero excluir el campo _id para todos los documentos en la colección Restaurantes:
db.restaurants.find({}, { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 })

// 4.Mostrar restaurant_id, name, borough y zip code, pero excluir el campo _id para todos los documentos en la colección Restaurantes:
db.restaurants.find({}, { _id: 0, restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1 })

// 5.Mostrar todos los restaurantes que están en el Bronx:
db.restaurants.find({ borough: "Bronx" })

// 6.Mostrar los primeros 5 restaurantes que están en el Bronx:
db.restaurants.find({borough: "Bronx"}, {grades: 0}).limit(5)

// 7.Mostrar el próximo 5 restaurantes después de saltar los primeros 5 del Bronx:
db.restaurants.find({ borough: "Bronx" }).skip(5).limit(5)

// 8.Encontrar los restaurantes que tienen un resultado además de 90:
db.restaurants.find({ "grades.score": { $gt: 90 } })

// 9.Encontrar los restaurantes que tienen un resultado además de 80 pero menos que 100:
db.restaurants.find({ "grades.score": { $gt: 80, $lt: 100 } })

// 10. Encontrar a los restaurantes que se localizan en valor de latitud menos de -95.754168:
db.restaurants.find({"address.coord.0": {$lt: -95.754168}})

// 11.Encontrar los restaurantes que no preparan ninguna cuisine de 'American' y su calificación es superior a 70 y longitud inferior a -65.754168:
db.restaurants.find({ cuisine: { $ne: "American" }, "grades.score": { $gt: 70 }, "address.coord.0": { $lt: -65.754168 } })

// 12. Encontrar a los restaurantes que no preparan ninguna cuisine de 'American' y consiguieron un marcador más de 70 y localizado en la longitud menos que -65.754168 sin utilizar $and operador:
db.restaurants.find({cuisine: {$nin: ["American", "American "]}, "grades.grade": "A", borough: {$ne: "Brooklyn"}}).sort({cuisine: -1})

// 13. Encontrar a los restaurantes que no preparan ninguna cuisine de 'American' y obtuvieron un punto de grado 'A' no pertenece a Brooklyn. Se debe mostrar el documento según la cuisine en orden descendente:
db.restaurants.find({ cuisine: { $ne: "American" }, borough: { $ne: "Brooklyn" }, "grades.grade": "A" }).sort({ cuisine: -1 })

// 14. Encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que contienen 'Wil' como las tres primeras letras en su nombre:
db.restaurants.find({ name: { $regex: /^Wil/ } }, { _id: 0, restaurante_id: 1, name: 1, borough: 1, cuisine: 1 })

// 15. Encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que contienen 'ces' como las últimas tres letras en su nombre:
db.restaurants.find({ name: { $regex: /ces$/ } }, { _id: 0, restaurante_id: 1, name: 1, borough: 1, cuisine: 1 })

// 16. Encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que contienen 'Reg' como tres letras en algún sitio en su nombre:
db.restaurants.find({ name: { $regex: /Reg/ } }, { _id: 0, restaurante_id: 1, name: 1, borough: 1, cuisine: 1 })

// 17. Encontrar los restaurantes que pertenecen al Bronx y prepararon cualquier plato americano o chino:
db.restaurants.find({ borough: "Bronx", cuisine: { $in: ["American", "Chinese"] } })

// 18. Encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que pertenecen a Staten Island o Queens o Bronx o Brooklyn:
db.restaurants.find({ borough: { $in: ["Staten Island", "Queens", "Bronx", "Brooklyn"] } }, { _id: 0, restaurante_id: 1, name: 1, borough: 1, cuisine: 1 })

// 19. Encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que no pertenecen a Staten Island o Queens o Bronx o Brooklyn:
db.restaurants.find({ borough: { $nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"] } }, { _id: 0, restaurante_id: 1, name: 1, borough: 1, cuisine: 1 })

// 20. Encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que consigan un marcador que no es más de 10:
db.restaurants.find({ "grades.score": { $not: { $gt: 10 } } }, { _id: 0, restaurante_id: 1, name: 1, borough: 1, cuisine: 1 })

// 21. Encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que preparan pescado excepto 'American' y 'Chinees' o el name del restaurante comienza con letras 'Wil':
db.restaurants.find({ $or: [{ cuisine: "Seafood", cuisine: { $nin: ["American", "Chinese"] } }, { name: { $regex: /^Wil/ } }] }, { _id: 0, restaurante_id: 1, name: 1, borough: 1, cuisine: 1 })

// 22. Encontrar el restaurant_id, name, y gradas para aquellos restaurantes que consigan un grado "A" y un score 11 en datos de estudio ISODate "2014-08-11T00:00:00Z":
db.restaurants.find({ "grades": { $elemMatch: { grade: "A", score: 11, date: ISODate("2014-08-11T00:00:00Z") } } }, { _id: 0, restaurante_id: 1, name: 1, grades: 1 })

// 23. Encontrar el restaurante_id, name y gradas para aquellos restaurantes donde el 2º elemento de variedad de grados contiene un grado de "A" y marcador 9 sobre un ISODate "2014-08-11T00:00:00Z":
db.restaurants.find({ $and: [{ "grades.1.grade": "A" }, { "grades.1.score": 9 }, { "grades.1.date": ISODate("2014-08-11T00:00:00Z") }] }, { _id: 0, restaurante_id: 1, name: 1, grades: 1 })

// 24. Encontrar el restaurante_id, name, dirección y ubicación geográfica para aquellos restaurantes en los que el segundo elemento del array coord contiene un valor que es más de 42 y hasta 52:
db.restaurants.find({ "address.coord.1": { $gt: 42, $lte: 52 } }, { _id: 0, restaurante_id: 1, name: 1, address: 1 })

// 25. Organizar el nombre de los restaurantes en orden ascendente junto a todas las columnas:
db.restaurants.find().sort({ name: 1 })

// 26. Organizar el nombre de los restaurantes en orden descendente junto a todas las columnas:
db.restaurants.find().sort({ name: -1 })

// 27. Organizar el nombre de la cuisine en orden ascendente y por el mismo borough de cuisine en orden descendente:
db.restaurants.find().sort({ cuisine: 1, borough: -1 })

// 28. Saber todas las direcciones que no contienen la calle:
db.restaurants.find({ "address.street": { $exists: false } })

// 29. Seleccionar todos los documentos en la colección de restaurantes cuyo valor del campo coord es Double:
db.restaurants.find({ "address.coord": { $type: "double" } })

// 30. Seleccionar el restaurante_id, name y grade para aquellos restaurantes que devuelvan 0 como resto después de dividir el marcador por 7:
db.restaurants.find({ "grades.score": { $mod: [7, 0] } }, { _id: 0, restaurante_id: 1, name: 1, grade: 1 })

// 31. Encontrar el name de restaurante, borough, longitud y latitud y cuisine para aquellos restaurantes que contienen 'mon' como tres letras en algún sitio de su nombre:
db.restaurants.find({ name: { $regex: /mon/ } }, { _id: 0, name: 1, borough: 1, "address.coord": 1, cuisine: 1 })

// 32. Encontrar el name de restaurante, borough, longitud y latitud y cuisine para aquellos restaurantes que contienen 'Mad' como primeras tres letras de su nombre:
db.restaurants.find({ name: { $regex: /^Mad/ } }, { _id: 0, name: 1, borough: 1, "address.coord": 1, cuisine: 1 })