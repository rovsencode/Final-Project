import { HttpClient } from "../HttpClient";

class GenreService extends HttpClient {
  constructor() {
    super("https://localhost:7152/api/Genre");
  }

  getAll() {
    return this.get("GetAll");
  }

  postNewPost(body) {
    return this.post("posts", body);
  }

  editPost(id, body) {
    return this.put("posts", body, id);
  }
}

export const genreService = new GenreService();
