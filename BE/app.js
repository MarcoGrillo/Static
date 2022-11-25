require('dotenv').config();
require('express-async-errors');
const express = require('express');
const app = express();


var bodyParser = require('body-parser');
app.use(bodyParser.json({ limit: '50mb' }));
app.use(
	bodyParser.urlencoded({
		limit: '50mb',
		extended: true,
		parameterLimit: 50000,
	})
);

const connectDB = require('./database/connect');

const courseRouter = require('./routes/courseRoutes');
const teacherRouter = require('./routes/teacherRoutes');
const packageRouter = require('./routes/packageRoutes');
const reviewRouter = require('./routes/reviewRoutes');
const authRouter = require('./routes/authRoutes');
const userRouter = require('./routes/userRoutes');
const videoRouter = require('./routes/videoRoutes');
const videoUpdateRouter = require('./routes/videoUpdateRoutes');
const stripeRouter = require('./routes/paymentRoutes');
const discordRouter = require('./routes/discordRoutes');

// Security packages
const cors = require('cors');
const xss = require('xss-clean');
const helmet = require('helmet');
const rateLimiter = require('express-rate-limit');

// Morgan
const morgan = require('morgan');

// Winston
const logger = require('./utils').genLogger();

// Cookie Parser
const cookieParser = require('cookie-parser');

// Morgan middleware
app.use(
	morgan(function (tokens, req, res) {
		const message = [
			tokens.method(req, res),
			tokens.url(req, res),
			tokens.status(req, res),
			tokens.res(req, res, 'content-length'),
			'-',
			tokens['response-time'](req, res),
			'ms',
		].join(' ');

		logger.log('info', message.trim());
	})
);

// Error handlers
const notFoundMiddleware = require('./middleware/not-found');
const errorHandlerMiddleware = require('./middleware/error-handler');

app.use(
	rateLimiter({
		windowMs: 15 * 60 * 1000,
		max: 100,
	})
);

// Middlewares
app.use(xss());
var corsOptions = {
	origin: process.env.ORIGIN,
	credentials: true,
};

app.use(cors(corsOptions));
app.use(function(req, res, next) {
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});
app.use(helmet());

app.use(express.json());
app.use(cookieParser(process.env.JWT_SECRET));

// Routes
app.use('/api/v1/courses', courseRouter);
app.use('/api/v1/teachers', teacherRouter);
app.use('/api/v1/packages', packageRouter);
app.use('/api/v1/reviews', reviewRouter);
app.use('/api/v1/auth', authRouter);
app.use('/api/v1/users', userRouter);
app.use('/api/v1/videos', videoRouter);
app.use('/api/v1/videoupdates', videoUpdateRouter);
app.use('/api/v1/stripe/payments', stripeRouter);
app.use('/api/v1/discord', discordRouter);

app.use(notFoundMiddleware);
app.use(errorHandlerMiddleware);

const port = process.env.PORT || 5000;
const mongodbURI =
	process.env.ENV === 'production'
		? process.env.MONGODB_URI
		: process.env.MONGODB_URI_DEV;

const start = async () => {
	try {
		await connectDB(mongodbURI);
		app.listen(port, () => {
			logger.log({
				level: 'info',
				message: `Server listening on port ${port}`,
			});
			console.log(`Server listening on port ${port}`);
		});
	} catch (err) {
		console.log(err);
	}
};

start();
