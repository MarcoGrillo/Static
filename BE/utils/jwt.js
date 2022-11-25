const jwt = require('jsonwebtoken');

const createToken = ({ payload }) => {
	const token = jwt.sign(payload, process.env.JWT_SECRET, {
		expiresIn: process.env.JWT_LIFETIME,
	});

	return token;
};

const isTokenValid = ({ token }) => {
	return jwt.verify(token, process.env.JWT_SECRET);
};

const attachCookiesToResponse = ({ res, user }) => {
	const token = createToken({ payload: user });
	return token;
	// res.cookie('token', token, {
	// 	httpOnly: true,
	// 	expires: new Date(Date.now() + 1000 * 60 * 60 * 24),
	// 	secure: process.env.ENVIRONMENT === 'production',
	// 	signed: true,
	// });
};

module.exports = {
	createToken,
	isTokenValid,
	attachCookiesToResponse,
};
