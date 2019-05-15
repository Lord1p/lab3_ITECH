(function() {
    "use strict";
  
    angular.module("lab3").controller("part-2", Part_2);
  
    function Part_2($scope, $http) {
      $scope.getAllTime = getAllTime;
      $scope.data = {
        selected: null,
        projects: []
      };
  
      $scope.result = null;
  
      init();
  
      function init() {
        $http
          .get("server/get-projects.php")
          .then(res => {
              console.log("projects gotten");
              console.log(res.data.projects);
              $scope.data.projects = res.data.projects;
        });
      }
  
      function getAllTime() {
          $http
            .post("server/get-time-by-project.php", { project: $scope.data.selected })
            .then(res => {
              console.log("time gotten");
              console.log(res.data.time);
              $scope.result = res.data.time;
            });
      }
    }
  })();
  