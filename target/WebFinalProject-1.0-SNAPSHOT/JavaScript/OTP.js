var nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'tuantuan3455@gmail.com',			//email ID
        pass: 'haodaubuoi'				//Password
    }
});
function sendMail(email , otp){
    var details = {
        from: 'tuantuan3455@gmail.com', // sender address same as above
        to: email, 					// Receiver's email id
        subject: 'Your demo OTP is ', // Subject of the mail.
        html: otp					// Sending OTP
    };


    transporter.sendMail(details, function (error, data) {
        if(error)
            console.log(error)
        else
            console.log(data);
    });
}

var email = "info@nodejsera.com";
var otp = "1234";
sendMail(email,otp);