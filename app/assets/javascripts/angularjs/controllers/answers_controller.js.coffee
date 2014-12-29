answersControllers = angular.module 'answersControllers', []

# Answers list
answersControllers.controller 'AnswersController', ($scope, $http) ->
  $http.get '/questions/' + $scope.questionId + '/answers/'
    .success (data, status, headers, config) -> $scope.answers = data

  # Pagination 
  $scope.currentPage = 0
  $scope.pageSize = 5 # max item on page
  $scope.numberOfPages = -> Math.ceil $scope.answers.length/$scope.pageSize

  # Add answer to list
  $scope.sendAnswer = ->
    data = answer: body: $scope.body

    $http.post '/questions/' + $scope.questionId + '/answers/', data
      .success (data, status, headers, config) -> $scope.answers.push data; $scope.body = ''
