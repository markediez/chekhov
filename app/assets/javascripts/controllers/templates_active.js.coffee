Chekhov.controller "TemplatesActiveIndexCtrl", @TemplatesActiveIndexCtrl = ($scope, $modal, $location, Checklists, User) ->
  $scope.loaded = false
  $scope.checklists = Checklists.query ->
    $scope.loaded = true
    $scope.user = User
  console.debug 'TemplatesActiveIndexCtrl', 'Initializing...'

  $('ul.nav li').removeClass 'active'
  $('ul.nav li#checklists_active').addClass 'active'
  
  $scope.openChecklist = (checklist_id) ->
    $location.path("/checklists/#{checklist_id}")
    
  $scope.deleteChecklist = (checklist) ->
    modalInstance = $modal.open
      templateUrl: "/assets/partials/checklist_delete.html"
      controller: ChecklistDeleteCtrl

    modalInstance.result.then () ->
      Checklists.delete {id: checklist.id}, (data) ->
        index = $scope.checklists.indexOf(checklist)
        $scope.checklists.splice(index,1)
