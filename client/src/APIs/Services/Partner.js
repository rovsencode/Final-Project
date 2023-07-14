import { HttpClient } from "../HttpClient";

class PartnerService extends HttpClient {
  constructor() {
    super("http://flixgo-001-site1.ctempurl.com/api/Partner");
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

export const partnerService = new PartnerService();