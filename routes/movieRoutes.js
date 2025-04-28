import express from "express";
import {
  getAllMovies,
  getOneMovie,
  createMovieHandler,
  deleteMovieHandler,
  patchMovie,
} from "./../controller/movieController.js";
import { verifyToken } from "../middleware/authMiddleware.js";

const router = express.Router();

router.get("/movies", verifyToken, getAllMovies);
router.get("/movies/:id", verifyToken, getOneMovie);
router.post("/movies", verifyToken, createMovieHandler);
router.delete("/movies/:id", verifyToken, deleteMovieHandler);
router.patch("/movies/:id", verifyToken, patchMovie);

export default router;
