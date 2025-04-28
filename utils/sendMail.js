import nodemailer from "nodemailer";

const sendMail = async (to, subject, htmlContent) => {
  const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: "muhammaddery65@gmail.com",
      pass: process.env.EMAIL_PASSWORD,
    },
  });

  const mailOptions = {
    from: "muhammaddery65@gmail.com",
    to,
    subject,
    html: htmlContent,
  };
  await transporter.sendMail(mailOptions);
};

export default sendMail;
