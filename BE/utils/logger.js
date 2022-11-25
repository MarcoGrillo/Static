require('winston-daily-rotate-file');

const { createLogger, format, transports } = require('winston');
const { combine, timestamp, label, printf, errors } = format;

const path = require('path');
const process = require('process');
const dayjs = require('dayjs');
const logFolder = '/logs';
const paths = ['anonycircle-be', 'anonycircle-be_error'];

const logFormat = printf(({ level, message, timestamp }) => {
	return `${timestamp} ${level}: ${message}`;
});

const timezoned = () => {
	// 2022-09-07T17:39:28.982
	return dayjs().format('YYYY-MM-DDTHH:mm:ss.SSS');
};

const transportsArray = {
	info: new transports.DailyRotateFile({
		filename: path.join(
			process.cwd(),
			logFolder,
			paths[0] + '_' + '%DATE%' + '.log'
		),
		datePattern: 'YYYY-MM-DD',
		level: 'info',
		maxSize: '20m',
	}),
};

const genLogger = () => {
	return createLogger({
		format: combine(
			label({ label: 'ANONYCIRCLE', message: true }),
			timestamp({ format: timezoned }),
			logFormat,
			errors({ stack: true })
		),
		transports: [transportsArray.info],
	});
};

module.exports = genLogger;
