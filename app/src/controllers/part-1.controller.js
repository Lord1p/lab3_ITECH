(function() {
  "use strict";

  angular.module("lab3").controller("part-1", Part_1);

  function Part_1($scope, $http) {
    $scope.getWorks = getWorks;
    $scope.data = {
      selected: null,
      date: null,
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

    function getWorks() {
        let postData = {
            project: $scope.data.selected, 
            date: $scope.data.date
        };

        $http
          .post("server/get-work-by-date.php", postData)
          .then(res => {
            console.log("works gotten");
            console.log(res.data.works);
            $scope.result = res.data.works;
          });
    }
  }
})();
