local typedefs = require "kong.db.schema.typedefs"

return {
  name = "convert-basic-auth",
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    { config = {
      type = "record",
      fields = {
          { client_id = typedefs.header_name {required = true, default = "X-Client-Id" } },
          { client_secret = typedefs.header_name {required = true, default = "X-Client-Secret" } },
        },
      }, },
    }
  }