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
  nextobjectid = 1,
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
      data = "eJxjYBgFowACHJkYGJyA2AWKXYHYjYm6duQDzSsA4kIgLgLiYiAuodAOczT9c4H8eUA8H4gXAPFCIF5EZX+MglEwCkbBYAMArI8IWg=="
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
      data = "eJxjYBgFowACOHHgwW4Hun56+GMUjIJRMAoGGwAAldUArA=="
    }
  }
}
