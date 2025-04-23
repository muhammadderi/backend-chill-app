import express from "express";
import {
  getAllMovies,
  getOneMovie,
  createMovieHandler,
  deleteMovieHandler,
  patchMovie,
} from "./../controller/movieController.js";

const router = express.Router();

router.get("/movies", getAllMovies);
router.get("/movies/:id", getOneMovie);
router.post("/movies", createMovieHandler);
router.delete("/movies/:id", deleteMovieHandler);
router.patch("/movies/:id", patchMovie);

export default router;
