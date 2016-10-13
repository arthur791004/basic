/**
 * Module exports
 */
module.exports = (function() {
  'use strict';

  /**
   * Module dependencies
   */
  const winston = require('winston');

  /**
   * Global Constants
   */
  const LOGGER = new winston.Logger({
    transports: [
      new winston.transports.File({
        filename: '<logfile>',
        level: process.env.DEBUG ? 'debug' : 'info',
        prettyPrint: true,
        handleExceptions: true,
        json: false,
        colorize: true
      })
    ],
    exitOnError: false
  });

  /**
   * Class
   */
  class <ModuleName> {
    constuctor() {
      // do something...
    }
  }

  return <ModuleName>
  /**
   * Functions
   */
})();
