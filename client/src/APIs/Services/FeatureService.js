import { HttpClient } from "../HttpClient";
class FeatureService extends HttpClient {
  constructor() {
    super("https://flixgo-001-site1.ctempurl.com/api/Feature");
  }
  getAll() {
    return this.get("GetAll");
  }
}
export const featureService = new FeatureService();
