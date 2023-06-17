import React from "react";
import { Formik, Form, Field } from "formik";
import "../../../Pages/Login/index.scss";
import { useParams } from "react-router-dom";
import { useLocation } from "react-router-dom";
import { accountService } from "../../../APIs/Services/AccountService";
function ResetPassword() {
  const location = useLocation();
  const search = decodeURIComponent(location.search);
  const searchParams = new URLSearchParams(search);
  const userId = searchParams.get("userId");
  const token = searchParams.get("token");
  const sanitizedToken = token.replace(/ /g, "+");
  const initialValues = {
    password: "",
    confirmPassword: "",
  };

  const handleSubmit = async (values) => {
    const { password, confirmPassword } = values;
    const form = {
      password: password,
      confirmPassword: confirmPassword,
      userId: userId,
      token: sanitizedToken,
    };
    console.log(form);
    const { data } = await accountService.resetPassword(form);
    console.log(data);

    if (data.errors) {
      data.errors.forEach((error) => {
        alert(error);
      });
    } else {
      alert(data.statusMessage);
    }
  };

  return (
    <div className="sign section--bg" data-bg="img/section/section.jpg">
      <div className="container">
        <div className="row">
          <div className="col-12">
            <div className="sign__content">
              {/* reset form */}
              <Formik initialValues={initialValues} onSubmit={handleSubmit}>
                <Form className="sign__form">
                  <a href="index.html" className="sign__logo">
                    <img src="img/logo.svg" alt="" />
                  </a>
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
                      name="confirmPassword"
                      className="sign__input"
                      placeholder="Re-enter Password"
                    />
                  </div>
                  <button className="sign__btn" type="submit">
                    Reset
                  </button>
                </Form>
              </Formik>
              {/* reset form */}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default ResetPassword;
