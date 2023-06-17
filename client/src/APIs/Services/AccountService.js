import { HttpClient } from "../HttpClient";

class AccountService extends HttpClient {
  constructor() {
    super("https://localhost:7152/api/Account");
  }

  forgetPassword(body) {
    return this.post("ForgetPassword", body);
  }

  resetPassword(body) {
    return this.post("ResetPassword", body);
  }
  signUp(body) {
    return this.post("Register", body);
  }
  signIn(body) {
    return this.post("Login", body);
  }
  setToken(token) {
    return this.setAuthToken(token);
  }
  clearToken() {
    return this.clearAuthToken();
  }
}
export const accountService = new AccountService();
