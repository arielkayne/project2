 var bcrypt = require('bcryptjs');

module.exports = function(sequelize, DataTypes){
	var User = sequelize.define("User",{
		firstName: DataTypes.STRING,
		lastName: DataTypes.STRING,
		deductible: DataTypes.INTEGER,
		username: DataTypes.STRING,
		password: DataTypes.STRING
	});

	User.associate = function(models){
		User.hasMany(models.Transaction,{
			onDelete:"cascade"
		});
	};
	return User;

	User.methods.generateHash = function(password) {
	    return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
	};

	// checking if password is valid
	User.methods.validPassword = function(password) {
	    return bcrypt.compareSync(password, this.local.password);
	};
	generateHash();
}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&/