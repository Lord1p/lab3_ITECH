angular
    .module("lab3", ["ngRoute"])
    .config(Rout);

function Rout($routeProvider) {
  $routeProvider.when("/", {
    redirectTo: "/part-1"
  });

  $routeProvider.when("/part-1", {
    templateUrl: "./app/src/views/part_1.html",
    controller: "part-1"
  });

  $routeProvider.when("/part-2", {
    templateUrl: "./app/src/views/part_2.html",
    controller: "part-2"
  });

  $routeProvider.when("/part-3", {
    templateUrl: "./app/src/views/part_3.html",
    controller: "part-3"
  });
}
