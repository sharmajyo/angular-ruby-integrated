/**
 * Created by jyotisharma on 9/01/2016.
 */
'use strict';
(function () {
    angular.module('survey.directives', [])
        .directive("averageStarRating", function () {
            return {
                restrict: "EA",
                templateUrl: "ngapp/templates/rating.html",
                scope: {
                    averageRatingValue: "=ngModel",
                    userResponded: "=",
                    max: "=?", //optional: default is 5
                },
                link: function (scope, elem, attrs) {
                    if (scope.max == undefined) {
                        scope.max = 5;
                    }
                    function updateStars() {
                        scope.stars = [];
                        for (var i = 0; i < scope.max; i++) {
                            scope.stars.push({});
                        }
                        var starContainerMaxWidth = 100; //%
                        scope.filledInStarsContainerWidth = scope.averageRatingValue / scope.max * starContainerMaxWidth;
                    };
                    scope.$watch("averageRatingValue", function (oldVal, newVal) {
                        if (newVal) {
                            updateStars();
                        }
                    });
                }
            };
        });
})()

