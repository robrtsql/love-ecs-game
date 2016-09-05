return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.17.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 25,
  height = 20,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 10,
  properties = {},
  tilesets = {
    {
      name = "town",
      firstgid = 1,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      image = "../tilesets/towntileset.png",
      imagewidth = 736,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 1472,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "floor",
      x = 0,
      y = 0,
      width = 25,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJx7yMTA8JAEvI6FgeErMwKD+KToH7WDfLNw4cFqB7J+WtqBTFPbDnxmEWsHKepHMX5Mj/j4zoyJh1NZMmrH4LfjOzN5dgAAvy+ylQ=="
    },
    {
      type = "tilelayer",
      name = "bg",
      x = 0,
      y = 0,
      width = 25,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFowACHJkYGJyA2AWKXYHYjYm6duQDzSsA4kIgLgLiYiAuodAOczT9c4H8eUA8H4gXAPFCIF6Exw4eoBwvlf05CkbBKBgF9AYAN3oIdw=="
    },
    {
      type = "tilelayer",
      name = "fg",
      x = 0,
      y = 0,
      width = 25,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFlIKnjAwMz4D4BRS/BOJXjNS1Q5iJgUEEiMWgWByIJZioawctAOcQcOMoGAWjYBQMBwAAJtkGDg=="
    },
    {
      type = "tilelayer",
      name = "collide",
      x = 0,
      y = 0,
      width = 25,
      height = 20,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFowACOHHgwW4Hun5S7eCF4lEwCkbBKBjKAAASaADG"
    },
    {
      type = "objectgroup",
      name = "obj",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 7,
          name = "",
          type = "sign",
          shape = "rectangle",
          x = 288,
          y = 112,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["message"] = "Hi! I'm a sign#I have a lot to say#Are you paying attention?"
          }
        }
      }
    }
  }
}
