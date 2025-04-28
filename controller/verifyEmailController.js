import db from "../db/index.js";

const verifyEmailController = async (req, res) => {
  try {
    const { token } = req.query;

    if (!token) {
      return res.status(400).json({ message: "Token is required" });
    }

    const [rows] = await db.query(
      `SELECT * FROM user WHERE verification_token = ?`,
      [token]
    );

    if (rows.length === 0) {
      return res.status(400).json({ message: "Invalid Verification Token" });
    }

    const user = rows[0];

    await db.query(
      `UPDATE user SET verification_token = NULL WHERE id_user = ?`,
      [user.id_user]
    );

    return res.status(200).json({ message: "Email Verified Successfully" });
  } catch (error) {
    console.error("Error verifying email:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

export default verifyEmailController;
