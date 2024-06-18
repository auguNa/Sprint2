db.createCollection('Comment', {validator: {$jsonSchema: {bsonType: 'object',title: 'Comment',required: ['user_id','text','date','like','dislike'],properties:{video_id:{bsonType: 'objectId'},user_id:{bsonType: 'objectId'},text:{bsonType: 'string'},date:{bsonType: 'date'},uploaded_by:{bsonType: 'objectId'},like:{bsonType: 'int'},dislike:{bsonType: 'int'}}}}});