(function() {
    "use strict";
  
    angular.module("lab3").controller("part-3", Part_3);
  
    function Part_3($scope, $http) {
      $scope.getCount = getCount;
      $scope.data = {
        selected: null,
        managers: []
      };
  
      $scope.result = null;
  
      init();
  
      function init() {
        $http
          .get("server/get-managers.php")
          .then(res => {
              console.log("managers gotten");
              console.log(res.data.managers);
              $scope.data.managers = res.data.managers;
        });
      }
  
      function getCount() {
          $http
            .post("server/get-workers-count-by-manager.php", { manager: $scope.data.selected})
            .then(res => {
              console.log("Count gotten");
              console.log(res.data.workersCount);
              $scope.result = res.data.workersCount;
            });
      }
    }
  })();
  