import React from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import * as Yup from "yup";
import { Button, Grid } from "@mui/material";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import MDButton from "components/MDButton";
import MDSnackbar from "components/MDSnackbar";
const validationSchema = Yup.object().shape({
  name: Yup.mixed().required("Name is required"),
});

function GenreCreate() {
  const navigate = useNavigate();
  const handleClick = () => {
    navigate("/genre");
  };

  const [successSB, setSuccessSB] = React.useState(false);
  const closeSuccessSB = () => setSuccessSB(false);
  const renderSuccessSB = (
    <MDSnackbar
      color="success"
      icon="check"
      content="Genre is created"
      dateTime="2 second agp"
      open={successSB}
      onClose={closeSuccessSB}
      close={closeSuccessSB}
      bgWhite
    />
  );

  const handleSubmit = async (values) => {
    console.log("isleyir");
    const { data } = await axios.post("https://localhost:7152/api/Genre/Create", values);
    if (data.errors === null) {
      setSuccessSB(true);
    }
  };
  return (
    <>
      <h1 style={{ display: "flex", justifyContent: "center", alignItems: "center" }}>
        Genre Create Form
      </h1>
      <div
        style={{
          marginTop: "50px",
          marginLeft: "0px",
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
      >
        <Formik
          initialValues={{
            name: "",
          }}
          validationSchema={validationSchema}
          onSubmit={handleSubmit}
        >
          {({ handleSubmit }) => (
            <Form onSubmit={handleSubmit}>
              <div
                className="form-group"
                style={{
                  width: "400px",
                  display: "flex",
                  justifyContent: "center",
                  textAlign: "center",
                }}
              >
                <label
                  style={{ marginRight: "5px", position: "relative", bottom: "20px" }}
                  htmlFor="name"
                  className="form-label"
                >
                  Name
                </label>
                <Field
                  style={{ width: "300px", position: "relative", bottom: "20px" }}
                  type="text"
                  name="name"
                  id="name"
                  className="form-control"
                />
                <div style={{ height: "20px" }}>
                  <ErrorMessage
                    component="div"
                    name="name"
                    style={{ color: "red", fontSize: "14px", marginTop: "-10px" }}
                  />
                </div>
              </div>
              <Button
                variant="contained"
                color="secondary"
                style={{
                  backgroundColor: "#FEEA8C",
                }}
                onClick={handleClick}
              >
                Cancel
              </Button>
              <Button
                style={{
                  marginTop: "10px",
                  position: "relative",
                  left: "200px",
                  color: "white",
                }}
                type="submit"
                variant="contained"
              >
                Submit
              </Button>
              {renderSuccessSB}
            </Form>
          )}
        </Formik>
      </div>
    </>
  );
}

export default GenreCreate;
