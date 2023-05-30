import React from "react";
import { Formik, Form, Field } from "formik";
import "../Login/index.scss";
import { accountService } from "../../APIs/Services/AccountService";

function Register() {
  const initialValues = {
    fullName: "",
    username: "",
    email: "",
    password: "",
    rePassword: "",
  };

  const handleSubmit = (values) => {
   const initialValues = {
      fullName: "",
      username: "",
      email: "",
      password: "",
      rePassword: "",
    };

    const postData = async () => {
      const { data } = await accountService.signUp(values);
      if (data.errors) {
        data.errors.forEach((error) => {
          alert(error);
        });
      } else {
        alert(data.statusMessage);
      }
    };
    postData();
    console.log(values);
  };

  return (
    <div className="sign section--bg" data-bg="img/section/section.jpg">
      <div className="container">
        <div className="row">
          <div className="col-12">
            <div className="sign__content">
              {/* registration form */}
              <Formik initialValues={initialValues} onSubmit={handleSubmit}>
                <Form className="sign__form">
                  <a href="index.html" className="sign__logo">
                    <img src="img/logo.svg" alt="" />
                  </a>
                  <div className="sign__group">
                    <Field
                      type="text"
                      name="fullName"
                      className="sign__input"
                      placeholder="Full Name"
                    />
                  </div>
                  <div className="sign__group">
                    <Field
                      type="text"
                      name="username"
                      className="sign__input"
                      placeholder="Username"
                    />
                  </div>
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
                  <div className="sign__group">
                    <Field
                      type="password"
                      name="rePassword"
                      className="sign__input"
                      placeholder="Re-enter Password"
                    />
                  </div>
                  <div className="sign__group sign__group--checkbox">
                    <Field
                      id="remember"
                      name="remember"
                      type="checkbox"
                      className="sign__checkbox"
                    />
                    <label htmlFor="remember">
                      I agree to the <a href="#">Privacy Policy</a>
                    </label>
                  </div>
                  <button className="sign__btn" type="submit">
                    Sign up
                  </button>
                  <span className="sign__text">
                    Already have an account?
                    <a href="signin.html">Sign in!</a>
                  </span>
                </Form>
              </Formik>
              {/* registration form */}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Register;
