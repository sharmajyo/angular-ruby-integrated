'use strict';
(function () {
    var ngApp = angular.module('ngApp', ["ui.router", 'survey.config',,
        "survey.controllers", "survey.directives", "survey.services",,"angularSpinners"]);

    angular.module('survey.config', [])
        .constant("API_URL", 'http://localhost:3000/');

    ngApp.config(['$stateProvider', '$httpProvider',
        function ($stateProvider, $httpProvider) {
            $httpProvider.interceptors.push('httpInterceptor');
              $stateProvider
                .state({
                    name: 'surveys-overview',
                    controller: "MainController",
                    url: '',
                    templateUrl: 'ngapp/sections/available-surveys/surveys-overview.html',
                    resolve: {
                        delayedData: ['$q', 'Survey', '$rootScope','$state','spinnerService',
                            function ($q, Survey, $rootScope,$state,spinnerService) {
                                var _defer = $q.defer();
                                Survey.get({}, function (success) {
                                    $rootScope.availableSurveys = success.survey_results;
                                    _defer.resolve();
                                }, function (error) {
                                    _defer.reject();
                                    spinnerService.hide('html5spinner');
                                    $state.go('error');
                                })

                                return _defer.promise;
                            }]
                    }
                })
                .state({
                    name: 'survey-details',
                    url: '/survey-details/:surveyId',
                    controller: 'SurveyController',
                    templateUrl: 'ngapp/sections/survey-details/survey-details.html',
                    resolve: {
                        delayedData: ['$q', 'Survey', '$rootScope','$state','$stateParams','spinnerService',
                            function ($q, Survey, $rootScope,$state,$stateParams,spinnerService) {
                                var _defer = $q.defer();
                                Survey.getById({id:$stateParams.surveyId}, function (success) {
                                    $rootScope.surveyDetail = success.survey_result_detail;
                                    _defer.resolve();
                                }, function (error) {
                                    _defer.reject();
                                    spinnerService.hide('html5spinner');
                                    $state.go('error');
                                })

                                return _defer.promise;
                            }]
                    }
                })
                .state({
                    name:'error',
                    url:'/error',
                    templateUrl:'ngapp/templates/error.html'
                })
        }])
})();

function round(value, decimal) {
    return Number(Math.round(value + 'e' + decimal) + 'e-' + decimal);
}