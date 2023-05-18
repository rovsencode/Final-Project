import { HttpClient } from "../HttpClient";
class FaqService extends HttpClient {
  constructor() {
    super("https://localhost:7152/api/Faq");
  }
  getAll() {
    return this.get("GetAll");
  }
}
export const faqService = new FaqService();
