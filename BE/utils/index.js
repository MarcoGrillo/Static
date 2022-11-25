const { createToken, isTokenValid, attachCookiesToResponse } = require('./jwt');
const createTokenUser = require('./createTokenUser');
const checkPermissions = require('./checkPermissions');
const genLogger = require('./logger');

module.exports = {
	createToken,
	isTokenValid,
	attachCookiesToResponse,
	createTokenUser,
	checkPermissions,
	genLogger,
};
