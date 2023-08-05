import { HttpClient } from "../HttpClient";

class ContactService extends HttpClient {
  constructor() {
    super("https://flixgo-001-site1.ctempurl.com/api/Contact");
  }

  getPost() {
    return this.get("GetLast");
  }

  postNewPost(body) {
    return this.post("posts", body);
  }

  editPost(id, body) {
    return this.put("posts", body, id);
  }
}

export const contactService = new ContactService();
