const Course = require('../models/Course');
const CustomError = require('../errors');
const { StatusCodes } = require('http-status-codes');

const getAllCourses = async (req, res) => {
	const courses = await Course.find({});
	res.status(StatusCodes.OK).json({ courses });
};

const getCourse = async (req, res) => {
	const course = await Course.findOne({ _id: req.params.id });

	if (!course) {
		throw new CustomError.NotFoundError(
			`No course with id ${req.params.id}`
		);
	}

	res.status(StatusCodes.OK).json({ course });
};

const createCourse = async (req, res) => {
	const course = await Course.create(req.body);
	res.status(StatusCodes.CREATED).json({ course });
};

const updateCourse = async (req, res) => {
	const course = await Course.findOneAndUpdate(
		{ _id: req.params.id },
		req.body,
		{
			new: true,
			runValidators: true,
		}
	);

	if (!course) {
		throw new CustomError.NotFoundError(
			`No course with id ${req.params.id}`
		);
	}

	res.status(StatusCodes.OK).json({ course });
};

module.exports = {
	getAllCourses,
	getCourse,
	createCourse,
	updateCourse,
};
