import { HttpClient } from "../HttpClient";
class QualityService extends HttpClient {
  constructor() {
    super("https://localhost:7152/api/Quality");
  }

  getAll() {
    return this.get("GetAll");
  }

  postNewPost(body) {
    return this.post("Create", body);
  }

  editPost(id, body) {
    return this.put("posts", body, id);
  }
}

export const qualityService = new QualityService();
