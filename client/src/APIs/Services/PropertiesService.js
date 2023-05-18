import { HttpClient } from "../HttpClient";

class PropertyService extends HttpClient {
  constructor() {
    super("https://localhost:7152/api/Property");
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

export const propertyService = new PropertyService();
