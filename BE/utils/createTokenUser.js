const createTokenUser = (user) => {
	return {
		first_name: user.first_name,
		last_name: user.last_name,
		userId: user._id,
		role: user.role,
		activePackage: user.activePackage,
		dueDatePackage: user.dueDatePackage,
		token: "",
		discordAccess: user.discordAccess,
		discordId: user.discordId,
	};
};

module.exports = createTokenUser;
