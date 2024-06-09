db.createCollection('customer', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'customer',
      required: ['Register_date'],
      properties: {
        Name: {
          bsonType: 'string'
        },
        Address: {
          bsonType: 'object',
          title: 'object',
          required: ['street', 'number', 'city', 'postal_code', 'country'],
          properties: {
            street: {
              bsonType: 'string'
            },
            number: {
              bsonType: 'int'
            },
            floor: {
              bsonType: 'string'
            },
            flat: {
              bsonType: 'string'
            },
            city: {
              bsonType: 'string'
            },
            postal_code: {
              bsonType: 'int'
            },
            country: {
              bsonType: 'string'
            }
          }
        },
        Phone: {
          bsonType: 'string'
        },
        Email: {
          bsonType: 'string'
        },
        Register_date: {
          bsonType: 'timestamp'
        },
        Last_shoppings: {
          bsonType: 'object',
          title: 'object',
          properties: {
            Glasses: {
              bsonType: 'object',
              title: 'object',
              required: ['Brand_Name', 'Frame_Type', 'Price'],
              properties: {
                Brand_Name: {
                  bsonType: 'string'
                },
                Graduation: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    Left: {
                      bsonType: 'double'
                    },
                    Right: {
                      bsonType: 'double'
                    }
                  }
                },
                Glass_Color: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    Left: {
                      bsonType: 'string'
                    },
                    Right: {
                      bsonType: 'string'
                    }
                  }
                },
                Frame_Type: {
                  enum:
                },
                Price: {
                  bsonType: 'double'
                }
              }
            }
          }
        }
      }
    }
  }
});
