import axios from "axios";

export class HttpClient {
  baseUrl;

  constructor(url) {
    this.baseUrl = url;
  }
  setAuthToken(token) {
    axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;
  }

  clearAuthToken() {
    delete axios.defaults.headers.common["Authorization"];
  }

  async get(endpoint) {
    return await axios.get(`${this.baseUrl}/${endpoint}`);
  }
  async getByID(endpoint, id) {
    return await axios.get(`${this.baseUrl}/${endpoint}/${id}`);
  }

  async getParams(endpoint, params) {
    return await axios.get(`${this.baseUrl}/${endpoint}/?${params}`);
  }

  async post(endpoint, body) {
    return await axios.post(`${this.baseUrl}/${endpoint}`, body);
  }
  async getSkip(endpoint, skip) {
    return await axios.get(`${this.baseUrl}/${endpoint}/${skip}`);
  }
  async search(endpoint, inputValue) {
    return await axios.get(`${this.baseUrl}/${endpoint}/${inputValue}`);
  }
  async put(endpoint, body, id) {
    return await axios.put(`${this.baseUrl}/${endpoint}/${id}`, body);
  }

  async patch(endpoint, body, id) {
    return await axios.patch(`${this.baseUrl}/${endpoint}/${id}`, body);
  }
  async delete(endpoint, id) {
    return await axios.delete(`${this.baseUrl}/${endpoint}/${id}`);
  }
}
