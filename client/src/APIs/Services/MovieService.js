import { HttpClient } from "../HttpClient";
class MovieService extends HttpClient {
  constructor() {
    super("https://localhost:7152/api/Movie");
  }
  skip(skip) {
    return this.getSkip("MovieCatalog", skip);
  }
  getMovie(movieId) {
    return this.getByID("GetOne", movieId);
  }
  movieVideo() {
    return this.get("MovieVideo");
  }
  create(body) {
    return this.post("Create", body);
  }
  searchFilter(inputValue) {
    return this.search("Search", inputValue);
  }
  getCount() {
    return this.get("MovieCount");
  }
  getYear() {
    return this.get("FilterData");
  }
  filterSort(params) {
    return this.getParams("FilterPage", params);
  }
  getAll() {
    return this.get("GetAll");
  }
}
export const movieService = new MovieService();
