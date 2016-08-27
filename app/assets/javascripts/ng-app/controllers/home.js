angular.module('myApp')
    .controller('HomeCtrl', function ($scope, itemsFactory) {
    
        $scope.newItem = {name:'', show: true};
        $scope.itemToEdit = {};
        $scope.items = itemsFactory.getAll();
        $scope.editing = false;

        $scope.addItem = function() {
            if ($scope.newItem && $scope.newItem.name.trim() == "") { return; }
            itemsFactory.addItem($scope.newItem);
            $scope.newItem = { name:'', show: true };
        };

        $scope.showOrHide = function(item) {
            itemsFactory.showOrHide(item);
        };

        $scope.edit = function(item) {
            $scope.editing = true;
            $scope.itemToEdit = item;
            $scope.newItem.name = item.name;
            $scope.newItem.show = item.show;
        };

        $scope.delete = function(item) {
            itemsFactory.delete(item);
        };

        $scope.saveItem = function() {
            itemsFactory.saveItem($scope.itemToEdit);
            $scope.itemToEdit = {};
            $scope.editing = false;
            $scope.newItem.name = "";
            $scope.newItem.show = true;
        };

    });