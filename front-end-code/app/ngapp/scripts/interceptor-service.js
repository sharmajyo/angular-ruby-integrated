'use strict';
angular.module('survey.services')
  .factory('httpInterceptor', ['$q', '$injector','spinnerService','API_URL',
    function ($q, $injector,spinnerService,API_URL) {
      return {
        request: function (config) {
          if(config.url.indexOf(API_URL)!=-1){
            spinnerService.show('html5spinner');
          }

          return config;
        },
        response: function (response) {
           if(response.config.url.indexOf(API_URL)!=-1) {
            spinnerService.hide('html5spinner');
          }
          return response;
        },
        requestError: function (rejection) {
          if(rejection.config.url.indexOf(API_URL)!=-1) {
            spinnerService.hide('html5spinner');
          }return $q.reject(rejection);
        },
        responseError: function (response) {

          if(response.config.url.indexOf(API_URL)!=-1) {
            spinnerService.hide('html5spinner');
          }return $q.reject(response);
        }
      };
    }]);


