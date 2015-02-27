inspectionRequestsControllers = angular.module 'inspectionRequestsControllers', []

inspectionRequestsControllers.controller 'InspectionRequestsController', ($scope, $http, ngDialog) ->
  $http.get '/inspection_requests/'
    .success (data, status, headers, config) ->
      $scope.requests = data

  $scope.sendRequest = ->
    data = {
      inspection_request: {
        name: $scope.name
        phone_number: $scope.phone_number
        comment: $scope.comment
      }
    }

    $http.post '/inspection_requests', data
      .success (data, status, headers, config) ->
        $scope.sentRequest = data
        $('#close_maintenance_form').click()

  $scope.showDetails = (requestId, index) ->
    $http.get '/inspection_requests/' + requestId
      .success (data, status, headers, config) ->
        $scope.requestDetails = data
        ngDialog.open({
          template: 'assets/angularjs/templates/inspection_requests/show.html'
          scope: $scope
          controller: 'InspectionRequestsController'
          className: 'ngdialog-theme-default'
        })
        $scope.requests.collection[index].viewed = data.viewed
