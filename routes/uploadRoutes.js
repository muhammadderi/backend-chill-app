import express from "express";
import upload from "../services/uploadService.js";
const router = express.Router();

router.post("/upload", upload.single("image"), (req, res) => {
  if (!req.file) {
    return res.status(400).json({ message: "Tidak ada file yang diunggah!" });
  }
  res.status(200).json({
    message: "File berhasil diunggah!",
    file: req.file,
  });
});

export default router;
