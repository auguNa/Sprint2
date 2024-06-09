db.createCollection('Videos ', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'Videos ',
      required: ['title', 'size', 'file_name', 'duration', 'upload_date'],
      properties: {
        title: {
          bsonType: 'string'
        },
        description: {
          bsonType: 'string'
        },
        size: {
          bsonType: 'int'
        },
        file_name: {
          bsonType: 'string'
        },
        duration: {
          bsonType: 'double'
        },
        thumbnail: {
          bsonType: 'string'
        },
        views: {
          bsonType: 'int'
        },
        likes: {
          bsonType: 'int'
        },
        dislikes: {
          bsonType: 'int'
        },
        state: {
          bsonType: 'string'
        },
        tags: {
          bsonType: 'string'
        },
        uploaded_by: {
          bsonType: 'objectId'
        },
        upload_date: {
          bsonType: 'date'
        }
      }
    }
  }
});