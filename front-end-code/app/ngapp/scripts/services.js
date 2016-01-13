/**
 * Created by jyotisharma on 10/01/2016.
 */
'use strict';
(function () {
    angular.module('survey.services', ['ngResource'])
        .factory('Survey', ['$resource','API_URL',
            function ($resource,API_URL) {

                return $resource(API_URL,{id: '@id'}, {
                    get: {
                        method: 'GET',
                        params: {format: 'json'},
                        isArray: false
                    },
                    getById: {
                        method: 'GET',
                        params: {format: 'json'},
                        isArray: false,
                        url: API_URL + '/survey_results/:id'
                    }
                })

            }])
})()