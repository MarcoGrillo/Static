const { StatusCodes } = require('http-status-codes');
const logger = require('../utils').genLogger();
const errorHandlerMiddleware = (err, req, res, next) => {
	let customError = {
		statusCode: err.statusCode || StatusCodes.INTERNAL_SERVER_ERROR,
		message: err.message || 'Something went wrong!',
	};

	// if (err instanceof CustomAPIError) {
	// 	return res.status(err.statusCode).json({ msg: err.message });
	// }

	if (err.name && err.name === 'ValidationError') {
		customError.message = `${Object.values(err.errors)
			.map((item) => item.message)
			.join(', ')}`;
		customError.statusCode = StatusCodes.BAD_REQUEST;
		logger.error(formatErrorMessage(req, err));
	}

	if (err.name && err.name === 'CastError') {
		customError.message = `No item found with id: ${err.value}`;
		customError.statusCode = StatusCodes.NOT_FOUND;
		logger.error(formatErrorMessage(req, err));
	}

	if (err.code && err.code === 11000) {
		customError.message = `Duplicate value entered for ${Object.keys(
			err.keyValue
		)} field.`;
		customError.statusCode = StatusCodes.BAD_REQUEST;
		logger.error(formatErrorMessage(req, err));
	}

	logger.error(formatErrorMessage(req, err));
	return res.status(customError.statusCode).json({ msg: err });
};

const formatErrorMessage = (req, err) => {
	// POST /api/v1/auth/login 401 33 - 204.537 ms
	return [req.method, req.originalUrl, err.statusCode, '-', err].join(' ');
};

module.exports = errorHandlerMiddleware;
