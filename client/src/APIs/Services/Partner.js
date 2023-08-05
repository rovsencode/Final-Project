import { HttpClient } from "../HttpClient";

class PartnerService extends HttpClient {
  constructor() {
    super("https://flixgo-001-site1.ctempurl.com/Partner");
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
