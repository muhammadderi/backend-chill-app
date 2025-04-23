import mysql from "mysql2";
import dotenv from "dotenv";
dotenv.config();

const pool = mysql
  .createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
  })
  .promise();

export async function getMovies() {
  const [rows] = await pool.query("SELECT * FROM movie");
  return rows;
}

export async function getMovie(id) {
  const [rows] = await pool.query("SELECT * FROM movie WHERE id_movie = ?", [
    id,
  ]);
  return rows[0];
}

export async function createMovie(
  title,
  image_url,
  rating,
  movie_date,
  detail,
  author,
  caster,
  watch_total
) {
  const [result] = await pool.query(
    `INSERT INTO movie (title, image_url, rating, movie_date, detail, author, caster, watch_total) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
    [title, image_url, rating, movie_date, detail, author, caster, watch_total]
  );
  const id = result.insertId;
  return getMovie(id);
}

export async function deleteMovie(id) {
  const [result] = await pool.query("DELETE FROM movie WHERE id_movie = ?", [
    id,
  ]);
  return result;
}

export async function updateMovie(id, fields) {
  const keys = Object.keys(fields);
  const values = Object.values(fields);

  if (keys.length === 0) {
    throw new Error("No fields to update");
  }

  const setClause = keys.map((key) => `${key} = ?`).join(", ");
  const sqlUpdate = `UPDATE movie SET ${setClause} WHERE id_movie = ?`;

  await pool.query(sqlUpdate, [...values, id]);

  return { message: "Movie updated successfully" };
}
