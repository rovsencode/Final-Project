import React, { useContext } from "react";
import { Formik, Form, Field } from "formik";
import "../Login/index.scss";
import { TokenContext } from "../../Contexts/tokenContext";
import { accountService } from "../../APIs/Services/AccountService";
import Header from "../../Components/Layout/Header";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import Register from "../Register";

function Login() {
  const navigate = useNavigate();
  const { setToken } = useContext(TokenContext);
  const initialValues = {
    email: "",
    password: "",
    remember: false,
  };

  const handleSubmit = async (values) => {
    const { data } = await accountService.signIn(values);
    console.log(data);
    if (data != undefined) {
      localStorage.setItem("token", data.token);
      localStorage.setItem("userName", data.userName);
      const token = localStorage.getItem("token");
      setToken(token);
      navigate("/");
    } else {
      console.log(data.errors);
    }
  };

  return (
    <>
      <div className="sign section--bg" data-bg="img/section/section.jpg">
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="sign__content">
                {/* authorization form */}
                <Formik initialValues={initialValues} onSubmit={handleSubmit}>
                  <Form className="sign__form">
                    <a href="index.html" className="sign__logo">
                      <img src="img/logo.svg" alt="" />
                    </a>
                    <div className="sign__group">
                      <Field
                        type="text"
                        name="email"
                        className="sign__input"
                        placeholder="Email"
                      />
                    </div>
                    <div className="sign__group">
                      <Field
                        type="password"
                        name="password"
                        className="sign__input"
                        placeholder="Password"
                      />
                    </div>
                    <div className="sign__group sign__group--checkbox">
                      <Field
                        id="remember"
                        name="remember"
                        type="checkbox"
                        className="sign__checkbox"
                      />
                      <label htmlFor="remember">Remember Me</label>
                    </div>

                    <button className="sign__btn" type="submit">
                      Sign in
                    </button>
                    <span className="sign__text">
                      Don't have an account?{" "}
                      <Link to={"/register"}>Sign up!</Link>
                    </span>
                    <span className="sign__text">
                      <a href="#">Forgot password?</a>
                    </span>
                  </Form>
                </Formik>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Login;
