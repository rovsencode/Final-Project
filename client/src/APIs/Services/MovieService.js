import { HttpClient } from "../HttpClient";
class MovieService extends HttpClient {
  constructor() {
    super("https://localhost:7152/api/Movie");
  }
  skip(skip) {
    return this.getSkip("MovieCatalog", skip);
  }
  searchFilter(inputValue) {
    return this.search("Search", inputValue);
  }
  getCount() {
    return this.get("MovieCount");
  }
}
export const movieService = new MovieService();
