import bcrypt from "bcrypt";
import pool from "../db/index.js";

export async function registerUser(
  user_role,
  fullname,
  username,
  email,
  password
) {
  const hashedPassword = await bcrypt.hash(password, 10);
  const [result] = await pool.query(
    `insert into user (user_role, fullname, username, email, password) values (?, ?, ?, ?, ?)`,
    [user_role, fullname, username, email, hashedPassword]
  );

  return { id: result.insertId, user_role, fullname, username, email };
}
