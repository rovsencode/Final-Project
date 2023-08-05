import { HttpClient } from "../HttpClient";

class GenreService extends HttpClient {
  constructor() {
    super("https://flixgo-001-site1.ctempurl.com/api/Genre");
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
