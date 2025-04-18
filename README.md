# 🎬 Movie REST API

A simple REST API for managing movies using Node.js, Express, and MySQL.

## 📚 API Endpoints

- `GET /movies` – Get all movies  
- `GET /movies/:id` – Get a movie by ID  
- `POST /movies` – Add a new movie  
- `PATCH /movies/:id` – Update a movie (partial)  
- `DELETE /movies/:id` – Delete a movie  

## 🧪 Example POST Body

```json
{
  "title": "Avengers: Endgame",
  "image_url": "https://example.com/endgame.jpg",
  "rating": "9.0",
  "movie_date": "2019-04-25T17:00:00.000Z",
  "detail": "Superhero team fights Thanos.",
  "author": "Marvel Studios",
  "caster": "Robert Downey Jr., Chris Evans",
  "watch_total": 1000000
}
