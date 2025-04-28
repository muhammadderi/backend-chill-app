import bcrypt from "bcrypt";
import pool from "../db/index.js";
import { v4 as uuid } from "uuid";
import sendEmail from "../utils/sendMail.js";

export async function registerUser(
  user_role,
  fullname,
  username,
  email,
  password
) {
  const hashedPassword = await bcrypt.hash(password, 10);
  const token = uuid();
  const [result] = await pool.query(
    `insert into user (user_role, fullname, username, email, password, verification_token) values (?, ?, ?, ?, ?, ?)`,
    [user_role, fullname, username, email, hashedPassword, token]
  );

  try {
    const emailContent = `
    <h1>Welcome to EduCourse</h1>
    <p>Click the link below to verify your email:</p>
    <a href="http://localhost:8000/verify-email?token=${token}">Verify Email</a>
  `;

    await sendEmail(email, "Verify Your Email", emailContent);
    res.status(201).json({
      message: "Register Successful, please check your email to verify",
    });

    return { id: result.insertId, user_role, fullname, username, email, token };
  } catch (error) {
    console.log("Error register", error);
    res.status(500).json({ error: "Internal server error" });
  }
}
