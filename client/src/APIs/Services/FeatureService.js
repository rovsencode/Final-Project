import { HttpClient } from "../HttpClient";
class FeatureService extends HttpClient {
  constructor() {
    super("https://localhost:7152/api/Feature");
  }
  getAll() {
    return this.get("GetAll");
  }
}
export const featureService = new FeatureService();
