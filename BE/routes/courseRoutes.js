const express = require('express');
const router = express.Router();
const {
	authenticateUser,
	authorizePermissions,
} = require('../middleware/authentication');
const {
	getAllCourses,
	createCourse,
	getCourse,
	updateCourse,
} = require('../controllers/courseController');

router
	.route('/')
	.get(getAllCourses)
	.post(authenticateUser, authorizePermissions('admin'), createCourse);
router
	.route('/:id')
	.get(authenticateUser, getCourse)
	.patch(authenticateUser, authorizePermissions('admin'), updateCourse);

module.exports = router;
