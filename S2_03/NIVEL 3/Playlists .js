db.createCollection('Playlists ', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'Playlists ',
      required: ['name', 'creation_date', 'state', 'created_by', 'videos'],
      properties: {
        name: {
          bsonType: 'string'
        },
        creation_date: {
          bsonType: 'date'
        },
        state: {
          bsonType: 'string'
        },
        created_by: {
          bsonType: 'objectId'
        },
        videos: {
          bsonType: 'objectId'
        },
        uploaded_by: {
          bsonType: 'objectId'
        }
      }
    }
  }
});