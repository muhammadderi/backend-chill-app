import getAllCourses from "../services/courseService.js";

export const getCourses = async (req, res) => {
  try {
    const { search, sort, author } = req.query;
    const courses = await getAllCourses({ search, sort, author });
    res.json(courses);
  } catch (error) {
    console.log("Error fetching courses: ", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};
