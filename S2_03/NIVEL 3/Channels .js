db.createCollection('Channels ', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'Channels ',
      required: ['name', 'description', 'creation_date', 'created_by'],
      properties: {
        name: {
          bsonType: 'string'
        },
        description: {
          bsonType: 'string'
        },
        creation_date: {
          bsonType: 'date'
        },
        created_by: {
          bsonType: 'objectId'
        }
      }
    }
  }
});