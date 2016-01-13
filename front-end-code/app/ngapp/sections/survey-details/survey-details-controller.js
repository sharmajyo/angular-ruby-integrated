'use strict';
(function () {

    angular.module('survey.controllers').controller("SurveyController", ["$rootScope", "$scope",
        function ($rootScope, $scope) {
            if ( $rootScope.surveyDetail) {
                $scope.responseRate = round($rootScope.surveyDetail.response_rate * 100, 2);

                //create a dataset for pi chart showing average theme rating
                $scope.chartDataSet = {labels: [], data: [], series: ['response-rate(%)']};

                $rootScope.surveyDetail.themes.forEach(function (theme) {
                    $scope.chartDataSet.labels.push(theme.name);
                    var theme_ques = theme.questions.length;
                    var theme_ratings = 0;
                    theme.questions.forEach(function (que) {
                        var ratings = 0;
                        var userResponded = 0;
                        que.survey_responses.forEach(function (response) {
                            ratings += isNaN(parseInt(response.response_content)) ? 0 : parseInt(response.response_content);
                            response.response_content == '' ? userResponded : userResponded++;
                        })

                        //add a rating value and users responded with every question, required for showing average rating
                        que.que_ratings = (ratings / userResponded).toPrecision(2);
                        que.userResponded = userResponded;
                        theme_ratings += parseFloat(que.que_ratings);

                    })

                    $scope.chartDataSet.data.push(round(theme_ratings / theme_ques, 2));
                })
            }


        }])
})();