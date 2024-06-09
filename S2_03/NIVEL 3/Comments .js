db.createCollection('Comments ', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'Comments ',
      properties: {
        video_id: {
          bsonType: 'objectId'
        },
        user_id: {
          bsonType: 'objectId'
        },
        text: {
          bsonType: 'string'
        },
        date: {
          bsonType: 'date'
        },
        uploaded_by: {
          bsonType: 'objectId'
        }
      }
    }
  }
});