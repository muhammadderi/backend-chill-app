import { registerUser } from "../services/authService.js";

export async function register(req, res) {
  try {
    const { user_role, fullname, username, email, password } = req.body;
    const user = await registerUser(
      user_role,
      fullname,
      username,
      email,
      password
    );
    res.status(200).json({ message: "Register success", user });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
}
