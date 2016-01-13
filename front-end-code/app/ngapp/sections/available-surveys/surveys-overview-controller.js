'use strict';
(function () {
    angular.module('survey.controllers', ["chart.js"])
        .controller("MainController", ["$rootScope", "$state", "$scope", "Survey",
            function ($rootScope, $state, $scope, Survey) {

                if ($rootScope.availableSurveys) {
                    //create a dataset for bar chart showing surveys response rate
                    $scope.chartDataSet = {labels: [], series: ['response-rate(%)']};
                    var response_data = [];
                    var colours = [];
                    $rootScope.availableSurveys.forEach(function (data) {
                        response_data.push(round(data.response_rate * 100, 2));
                        $scope.chartDataSet.labels.push(data.name);
                        //for survey response less than 40% bar color should be red, less then 60% bar color
                        //should be orange and if response rate is more than 60%, color is green.
                        if (data.response_rate < 0.40) {
                            colours.push('#f00');
                        }
                        else if (data.response_rate < 0.60) {
                            colours.push('#ff0');
                        }
                        else {
                            colours.push('rgba(19, 251, 40, 0.27)');
                        }
                    })
                    $scope.chartDataSet.chartData = [response_data];
                    $scope.chartDataSet.colours = [{fillColor: colours}];
                }

                // show selected survey
                $scope.viewSurvey = function (survey) {
                    $state.go('survey-details', {surveyId: survey.url.replace('/survey_results/', '')});
                }

            }])
})();
