import bcrypt from "bcrypt";
import pool from "../db/index.js";
import { v4 as uuid } from "uuid";
import sendEmail from "../utils/sendMail.js";

export async function registerUser(
  user_role,
  fullname,
  username,
  email,
  password,
  res
) {
  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    const token = uuid();

    const [result] = await pool.query(
      `INSERT INTO user (user_role, fullname, username, email, password, verification_token) VALUES (?, ?, ?, ?, ?, ?)`,
      [user_role, fullname, username, email, hashedPassword, token]
    );

    const emailContent = `
      <h1>Welcome to EduCourse</h1>
      <p>Click the link below to verify your email:</p>
      <a href="http://localhost:8000/verifikasi-email?token=${token}">Verify Email</a>
    `;

    await sendEmail(email, "Verify Your Email", emailContent);

    return res.status(201).json({
      message: "Register Successful, please check your email to verify",
    });
  } catch (error) {
    console.error("Error during registration:", error);
    return res.status(500).json({ error: "Internal Server Error" });
  }
}
