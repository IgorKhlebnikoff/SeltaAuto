importsControllers = angular.module 'importsControllers', []

importsControllers.controller 'ImportsController', ($scope, $http) ->
  $http.get '/imports/' + $scope.importId + '/necessary_columns/'
    .success (data, status, headers, config) -> $scope.necessary_columns = data

  $scope.updateColumns = ->
    data = import: necessary_columns: $scope.necessary_columns

    $http.put '/imports/' + $scope.importId + '/update_columns/', data
      .success (data, status, headers, config) -> $scope.columns.push data; $scope.body = ''
