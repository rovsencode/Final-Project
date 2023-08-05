import React, { useContext } from "react";
import { Button } from "antd";
import { Formik, Form, Field, ErrorMessage } from "formik";
import "../Login/index.scss";
import { TokenContext } from "../../Contexts/tokenContext";
import { accountService } from "../../APIs/Services/AccountService";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import { useState } from "react";
import { green } from "@mui/material/colors";
import * as Yup from "yup";

function Login() {
  const [loading, setLoading] = React.useState(false);
  const [success, setSuccess] = React.useState(false);
  const navigate = useNavigate();
  const { setToken } = useContext(TokenContext);
  const validationSchema = Yup.object().shape({
    password: Yup.string().required("Password is required"),
    email: Yup.string().email("Invalid email").required("Email is required"),
  });
  const initialValues = {
    email: "",
    password: "",
    remember: false,
  };

  const handleSubmit = async (values) => {
    if (!success) {
      setLoading(true);
    }
    const { data } = await accountService.signIn(values);
    console.log(data);
    if (data !== undefined) {
      setLoading(false);
      setSuccess(true);
      localStorage.setItem("token", data.token);
      localStorage.setItem("userName", data.userName);
      const token = localStorage.getItem("token");
      setToken(token);
      setTimeout(() => {
        navigate("/");
      }, 1000);
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
                <Formik
                  initialValues={initialValues}
                  onSubmit={handleSubmit}
                  validationSchema={validationSchema}
                >
                  <Form className="sign__form">
                    <a href="index.html" className="sign__logo">
                      <img src="img/logo.svg" alt="" />
                    </a>
                    <div className="sign__group">
                      <Field
                        type="text"
                        name="email"
                        id="email"
                        className="sign__input"
                        placeholder="Email"
                      />
                      <ErrorMessage
                        name="email"
                        component="div"
                        className="error"
                      />
                    </div>

                    <div className="sign__group">
                      <Field
                        type="password"
                        name="password"
                        className="sign__input"
                        placeholder="Password"
                      />
                      <ErrorMessage
                        name="password"
                        component="div"
                        className="error"
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

                    <Button
                      htmlType="submit"
                      loading={loading}
                      className={success ? "sign__btn success" : "sign__btn"}
                    >
                      {success ? (
                        <>
                          Success
                          <span className="success-icon">
                            <svg
                              xmlns="http://www.w3.org/2000/svg"
                              viewBox="0 0 24 24"
                              fill="none"
                              stroke="currentColor"
                              strokeWidth="2"
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              className="icon-check"
                            >
                              <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
                              <polyline points="22 4 12 14.01 9 11.01" />
                            </svg>
                          </span>
                        </>
                      ) : (
                        "Sign in"
                      )}
                    </Button>
                    <span className="sign__text">
                      Don't have an account?{" "}
                      <Link to={"/register"}>Sign up!</Link>
                    </span>
                    <span className="sign__text">
                      <Link to="/forgetPassword">Forgot password?</Link>
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
