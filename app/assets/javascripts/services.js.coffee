angular.module("chekhovServices", ["ngResource"])
  .factory "Templates", ($resource) ->
    $resource "/templates/:id.json",
      id: "@id"
    ,
      update:
        method: "PUT"
  .factory "Checklists", ($resource) ->
    $resource "/checklists/:id.json",
      id: "@id"
    ,
      update:
        method: "PUT"
  .factory "User", () ->
    user = { id: 1 }
