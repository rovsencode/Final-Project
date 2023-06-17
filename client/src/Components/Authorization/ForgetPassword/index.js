import React from "react";
import { Formik, Form, Field } from "formik";
import "../../../Pages/Login/index.scss";
import { accountService } from "../../../APIs/Services/AccountService";
function ForgetPassword() {
  const initialValues = {
    email: "",
  };

  const handleSubmit = async (values) => {
    const { data } = await accountService.forgetPassword(values);
    console.log(data);
    if (data.statusCode === 200) {
      alert(data.statusMessage);
    } else {
      alert(data.errors);
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
                    <button className="sign__btn" type="submit">
                      Send
                    </button>
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

export default ForgetPassword;
