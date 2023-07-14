import { HttpClient } from "../HttpClient";
class QualityService extends HttpClient {
  constructor() {
    super("http://flixgo-001-site1.ctempurl.com/api/Quality");
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
