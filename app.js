import express from "express";
import {
  getMovies,
  getMovie,
  createMovie,
  deleteMovie,
  updateMovie,
} from "./database.js";

const app = express();
app.use(express.json());

app.get("/movies", async (req, res) => {
  const movies = await getMovies();
  res.send(movies);
});

app.get("/movies/:id", async (req, res) => {
  const id = req.params.id;
  const movie = await getMovie(id);
  res.send(movie);
});

app.delete("/movies/:id", async (req, res) => {
  const id = req.params.id;
  const movie = await deleteMovie(id);
  res.send(movie);
});

app.post("/movies", async (req, res) => {
  const {
    title,
    image_url,
    rating,
    movie_date,
    detail,
    author,
    caster,
    watch_total,
  } = req.body;
  const movie = await createMovie(
    title,
    image_url,
    rating,
    movie_date,
    detail,
    author,
    caster,
    watch_total
  );
  res.status(200).send(movie);
});

app.patch("/movies/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const fields = req.body;

    const movie = await updateMovie(id, fields);
    res.status(200).send(movie);
  } catch (err) {
    console.error("Error in PATCH /movies/:id:", err.message);
    res.status(500).send("Something went wrong in updateMovie");
  }
});

app.use((err, req, res, next) => {
  console.log(err.stack);
  res.status(500).send("Something Broke!");
});

app.listen(8000, () => {
  console.log("app is running on port 8000");
});
