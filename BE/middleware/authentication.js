const { isTokenValid } = require('../utils');
const CustomError = require('../errors');

const authenticateUser = async (req, res, next) => {
	const token = req.header('Authorization');

	if (!token) {
		throw new CustomError.UnauthenticatedError('user not authenticated');
	}

	try {
		const { first_name, last_name, userId, role } = isTokenValid({ token });
		req.user = { first_name, last_name, userId, role };
		next();
	} catch (error) {
		throw new CustomError.UnauthenticatedError('user not authenticated');
	}
};

const authorizePermissions = (...roles) => {
	return (req, res, next) => {
		if (!roles.includes(req.user.role)) {
			throw new CustomError.UnauthorizedError(
				'user not authorized to access this route'
			);
		}

		next();
	};
};

module.exports = { authenticateUser, authorizePermissions };
