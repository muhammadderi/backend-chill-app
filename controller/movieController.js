import {
  getMovies,
  getMovie,
  createMovie,
  deleteMovie,
  updateMovie,
} from "../services/movieService.js";

export async function getAllMovies(req, res) {
  const movies = await getMovies();
  res.send(movies);
}

export async function getOneMovie(req, res) {
  const id = req.params.id;
  const movie = await getMovie(id);
  res.send(movie);
}

export async function createMovieHandler(req, res) {
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
}

export async function deleteMovieHandler(req, res) {
  const id = req.params.id;
  const movie = await deleteMovie(id);
  res.send(movie);
}

export async function patchMovie(req, res) {
  try {
    const id = req.params.id;
    const fields = req.body;

    const movie = await updateMovie(id, fields);
    res.status(200).send(movie);
  } catch (err) {
    console.error("Error in PATCH /movies/:id:", err.message);
    res.status(500).send("Something went wrong in updateMovie");
  }
}
