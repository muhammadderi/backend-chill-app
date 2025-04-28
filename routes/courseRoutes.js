import express from "express";
import { verifyToken } from "../middleware/authMiddleware.js";
import { getCourses } from "../controller/courseController.js";

const router = express.Router();
router.get("/courses", verifyToken, getCourses);

export default router;
