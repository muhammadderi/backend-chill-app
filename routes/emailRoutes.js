import express from "express";
const router = express.Router();
import verifyEmailController from "../controller/verifyEmailController.js";

router.get("/verifikasi-email", verifyEmailController);

export default router;
