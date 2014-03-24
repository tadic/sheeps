
    function SeepsController($scope, $http) {
        $http.get('sheep.json').success( function(data, status, headers, config) {
            $scope.sheeps = data;
        });
        $scope.order = 'percent_of_r';
        $scope.reverse = false
        $scope.click = function (order){
            $scope.order = order;
            $scope.reverse =!$scope.reverse
            console.log(order);
        }
        $scope.searchText = 'na farmi';
    }
