const mongoose = require('mongoose');

const CourseSchema = new mongoose.Schema(
	{
		name: {
			type: String,
			required: true,
			trim: true,
			maxlength: 256,
			unique: true,
		},
		description: {
			type: String,
			required: true,
			trime: true,
			maxlength: 3000,
		},
		num_videos: {
			type: Number,
			required: true,
		},
		available: {
			type: Boolean,
			default: false,
		},
		package: [
			{
				type: mongoose.Types.ObjectId,
				ref: 'Package',
				required: true,
				unique: true,
			},
		],
		teacher: [{
			type: mongoose.Types.ObjectId,
			ref: 'Teacher',
			required: true,
		}],
		thumbnail: {
			type: String,
			required: false
		}
	},
	{ timestamps: true }
);

module.exports = mongoose.model('Course', CourseSchema);
