import express from "express";
import movieRoutes from "./routes/movieRoutes.js";
import authRoutes from "./routes/authRoutes.js";
import loginRoutes from "./routes/loginRoutes.js";
import courseRoutes from "./routes/courseRoutes.js";
import emailRoutes from "./routes/emailRoutes.js";
import uploadRoutes from "./routes/uploadRoutes.js";
import dotenv from "dotenv";
dotenv.config();

const app = express();
app.use(express.json());

app.use(movieRoutes);
app.use(authRoutes);
app.use(loginRoutes);
app.use(courseRoutes);
app.use(emailRoutes);
app.use(uploadRoutes);

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});

app.listen(8000, () => {
  console.log("App running on port 8000");
});
