db.createCollection('Subscriptions ', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'Subscriptions ',
      required: ['user_id', 'channel_id', 'subscription_date'],
      properties: {
        user_id: {
          bsonType: 'objectId'
        },
        channel_id: {
          bsonType: 'objectId'
        },
        subscription_date: {
          bsonType: 'date'
        }
      }
    }
  }
});