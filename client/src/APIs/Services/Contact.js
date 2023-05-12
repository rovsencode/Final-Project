import { HttpClient } from "../HttpClient";

class ContactService extends HttpClient {
  constructor() {
    super("https://localhost:7152/api/Contact");
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