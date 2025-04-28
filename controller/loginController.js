import { loginUser } from "../services/loginService.js";

export async function login(req, res) {
  const { email, password } = req.body;

  try {
    const result = await loginUser(email, password);
    res.status(200).json({
      message: "login successful",
      token: result.token,
      user: result.user,
    });
  } catch (error) {
    res.status(401).json({ error: error.message });
  }
}
