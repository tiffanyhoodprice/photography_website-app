(function() {
  "use strict";

  angular.module("app").controller("fav_photosCtrl",
    function($scope, $http) {

      $scope.setup = function() {
        $http.get("/api/v1/favorite_photos.json").then(function(response) {
          $scope.favPhotos = response.data;
          console.log($scope.favPhotos);
        });

$scope.toggleFavorites = function(photo) {

      if (photo.isFavorited) {
        $http.delete('/api/v1/favorite_photos/' + photo.id).then(function(response) {
          $scope.favoritePhotoId = response.data.favorite_photos
        })
      } else {
        $http.post('/api/v1/favorite_photos.json?photo_id=' + photo.id).then(function(response) {
          $scope.favoritePhotoId = response.data.favorite_photos
        });
      }

      photo.isFavorited = !photo.isFavorited;
    };

    window.scope = $scope;
  });

}());
