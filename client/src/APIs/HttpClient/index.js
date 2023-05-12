import axios from 'axios'

export class HttpClient {
  baseUrl;

  constructor(url) {
    this.baseUrl = url;
  }

  async get(endpoint) {
    return await axios.get(`${this.baseUrl}/${endpoint}`);
  }

  async post(endpoint, body) {
    return await axios.post(`${this.baseUrl}/${endpoint}`, body);
  }
  async put(endpoint, body, id) {
    return await axios.put(`${this.baseUrl}/${endpoint}/${id}`, body);
  }

  async patch(endpoint, body, id) {
    return await axios.patch(`${this.baseUrl}/${endpoint}/${id}`, body);
    }
    async delete(endpoint, id) {
        return await axios.delete(`${this.baseUrl}/${endpoint}/${id}`)
    }
}