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
  nextobjectid = 14,
  properties = {},
  tilesets = {
    {
      name = "town",
      firstgid = 1,
      filename = "town.tsx",
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
      data = "eJw7yMTA8J6GOBWIPwAxOYCbBH3k2kEKGO52OALFnYDYBYpdgdiNTPfgsiMfKF4AxIVAXATExUBcQqEd5mj65wL584B4PhAvAOKFQLwIjx08QDleHPLDPc5H7Ri1Y9QO+tghy0z7uhYA7GtGhw=="
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
      data = "eJzjZWBg4KUDpjUYtYNyOzhx4MFuB7p+Uu3Al0aHe5yP2jFqx6gd9LOD1hgAwxMEOg=="
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
            ["message"] = "[\n    {\n        \"text\":\"let the bodies hit the floor\",\n        \"effects\":{}\n    },\n    {\n        \"text\":\"let the bodies hit the floor\",\n        \"effects\":{}\n    },\n    {\n        \"text\":\"let the bodies hit the floor\",\n        \"effects\":{}\n    },\n    {\n        \"text\":\"let the bodies hit the\",\n        \"effects\":{}\n    },\n    {\n        \"text\":\". . . .\",\n        \"effects\":{}\n    },\n    {\n        \"text\":\"FLOOOOOOOOOOOOOOOOOOOOOOOOOOR\",\n        \"effects\":{\"wave\":true}\n    }\n]\n"
          }
        },
        {
          id = 10,
          name = "",
          type = "teleport",
          shape = "rectangle",
          x = 400,
          y = 0,
          width = 16,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {
            ["obj"] = "{\n    \"destination\":\"town2\",\n    \"newPosition\":{\"x\":0},\n    \"direction\":\"right\"\n}"
          }
        },
        {
          id = 11,
          name = "",
          type = "sign",
          shape = "rectangle",
          x = 224,
          y = 16,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["message"] = "[\n    {\n        \"text\":\"Sorry, you can't come through here.\",\n        \"effects\":{}\n    },\n    {\n        \"text\":\"This area has not been designed yet!\",\n        \"effects\":{}\n    }\n]\n"
          }
        },
        {
          id = 13,
          name = "",
          type = "defaultspawn",
          shape = "rectangle",
          x = 128,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
