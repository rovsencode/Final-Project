import { HttpClient } from "../HttpClient";

class PlansService extends HttpClient {
  constructor() {
    super("http://flixgo-001-site1.ctempurl.com/api/Plans");
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
  getId(id) {
    return this.getByID("GetOne", id);
  }
}

export const plansService = new PlansService();
