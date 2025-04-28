import pool from "../db/index.js";

async function getAllCourses({ search, sort, author }) {
  let query = "select * from movie";
  const params = [];

  const conditions = [];

  if (search) {
    conditions.push(`title like ?`);
    params.push(`%${search}%`);
  }

  if (author) {
    conditions.push(`author = ?`);
    params.push(author);
  }

  if (conditions.length > 0) {
    query +=
      ` 
    where ` + conditions.join(" and ");
  }

  if (sort === "asc") {
    query += ` order by title asc`;
  } else if (sort === "desc") {
    query += ` order by title desc`;
  }

  const [rows] = await pool.query(query, params);
  return rows;
}

export default getAllCourses;
