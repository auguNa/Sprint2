db.createCollection('Users ', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'Users ',
      required: ['email', 'password', 'username', 'birthdate', 'gender', 'country', 'post_code'],
      properties: {
        email: {
          bsonType: 'string'
        },
        password: {
          bsonType: 'string'
        },
        username: {
          bsonType: 'string'
        },
        birthdate: {
          bsonType: 'date'
        },
        gender: {
          enum:
        },
        country: {
          bsonType: 'string'
        },
        post_code: {
          bsonType: 'string'
        }
      }
    }
  }
});