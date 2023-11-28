const db = require('../app/config/db');
const ResultInfos = require('./resultInfo');
const usersModel = {


    async signup(lastname,firstname,address,email,password) {

        const UserExist = `SELECT * FROM users WHERE email=$1`;

       
        const resultUserExist = await db.query(UserExist, [email]);
        console.log('ici',resultUserExist.command);


        if (resultUserExist.rowCount === 0) {
            const resultInfo = new ResultInfos(true,201,'Success to create account.', resultUserExist.command);
            return resultInfo.getInfos();
            
        } else {
            console.log("ahaha")
        }
    }
};

module.exports = usersModel;