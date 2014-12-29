filters = angular.module 'filters', []

filters.filter 'startFrom', -> (input, start) -> start = +start; input.slice start
