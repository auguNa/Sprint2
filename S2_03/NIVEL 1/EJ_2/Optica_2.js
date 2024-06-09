db.createCollection('Glasses', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'Glasses',
      required: ['Brand', 'Frame_Type', 'Supplier', 'Price'],
      properties: {
        Brand: {
          bsonType: 'string'
        },
        Frame_Type: {
          enum:
        },
        Supplier: {
          bsonType: 'object',
          title: 'object',
          required: ['NIF', 'Name', 'Phone'],
          properties: {
            NIF: {
              bsonType: 'string'
            },
            Name: {
              bsonType: 'string'
            },
            Phone: {
              bsonType: 'string'
            },
            Fax: {
              bsonType: 'string'
            },
            Address: {
              bsonType: 'object',
              title: 'object',
              required: ['Street', 'Number', 'Flat', 'Post_code', 'City', 'Country'],
              properties: {
                Street: {
                  bsonType: 'string'
                },
                Number: {
                  bsonType: 'string'
                },
                Flat: {
                  bsonType: 'string'
                },
                Post_code: {
                  bsonType: 'string'
                },
                City: {
                  bsonType: 'string'
                },
                Country: {
                  bsonType: 'string'
                }
              }
            }
          }
        },
        Price: {
          bsonType: 'double'
        },
        Customer: {
          bsonType: 'object',
          title: 'object',
          required: ['Name', 'Phone', 'Email', 'Register_date'],
          properties: {
            Name: {
              bsonType: 'string'
            },
            Phone: {
              bsonType: 'int'
            },
            Email: {
              bsonType: 'string'
            },
            Register_date: {
              bsonType: 'timestamp'
            },
            Address: {
              bsonType: 'object',
              title: 'object',
              required: ['Street', 'Number', 'Flat', 'Post_code', 'City', 'Country'],
              properties: {
                Street: {
                  bsonType: 'string'
                },
                Number: {
                  bsonType: 'string'
                },
                Flat: {
                  bsonType: 'string'
                },
                Post_code: {
                  bsonType: 'string'
                },
                City: {
                  bsonType: 'string'
                },
                Country: {
                  bsonType: 'string'
                }
              }
            }
          }
        }
      }
    }
  }
});
