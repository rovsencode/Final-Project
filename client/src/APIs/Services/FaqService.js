import { HttpClient } from "../HttpClient";

class FaqService extends HttpClient {
  constructor() {
    super("https://flixgo-001-site1.ctempurl.com/api/Faq");
  }
  getAll() {
    return this.get("GetAll");
  }
}
export const faqService = new FaqService();
