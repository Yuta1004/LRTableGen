{ name = "lr-table-gen"
, dependencies =
  [ "console"
  , "effect"
  , "enums"
  , "halogen"
  , "prelude"
  , "strings"
  , "unordered-collections"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
