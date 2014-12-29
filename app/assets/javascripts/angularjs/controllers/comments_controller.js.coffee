commentsControllers = angular.module 'commentsControllers', []

# Comments list
commentsControllers.controller 'CommentsController', ($scope, $http) ->
  $http.get '/news/' + $scope.newsId + '/comments/'
    .success (data, status, headers, config) -> $scope.comments = data

  # Pagination
  $scope.currentPage = 0
  $scope.pageSize = 5 # max item on page
  $scope.numberOfPages = -> Math.ceil $scope.comments.length/$scope.pageSize

  # Add comment to list
  $scope.sendComment = ->
    data = comment: body: $scope.body

    $http.post '/news/' + $scope.newsId + '/comments/', data
      .success (data, status, headers, config) -> $scope.comments.push data; $scope.body = ''
