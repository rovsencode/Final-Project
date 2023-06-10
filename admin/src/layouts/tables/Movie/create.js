import React from "react";
import { Formik, Form, Field, ErrorMessage, yupToFormErrors } from "formik";
import * as Yup from "yup";
import { Button, Grid } from "@mui/material";
import { useNavigate } from "react-router-dom";
import axios from "axios";

import { Slider } from "@mui/material";
import MDSnackbar from "components/MDSnackbar";
import "react-datetime/css/react-datetime.css";
const validationSchema = Yup.object().shape({
  name: Yup.mixed().required("Name is required"),
  description: Yup.mixed().required("Description is required"),
  quality: Yup.mixed().required("Quality is required"),
  genre: Yup.mixed().required("genre is required"),
  actress: Yup.mixed().required("actress is required"),
});

function MovieCreate() {
  const [raiting, setRaiting] = React.useState([5]);
  const handleSliderChange = (event, newRaiting) => {
    setRaiting(newRaiting);
  };
  React.useEffect(() => {
    fetchGenre();
    fetchQualiyt();
    fetchActress();
  }, []);
  const navigate = useNavigate();
  const handleClick = () => {
    navigate("/movie");
  };

  const [successSB, setSuccessSB] = React.useState(false);
  const closeSuccessSB = () => setSuccessSB(false);
  const [genreOptions, setGenreOptions] = React.useState([]);
  const [qualityOptions, setQualityOptions] = React.useState([]);
  const [actressOptions, setActressOptions] = React.useState([]);
  const fetchGenre = async () => {
    const { data } = await axios.get("https://localhost:7152/api/Genre/GetAll");
    setGenreOptions(data);
  };
  const fetchQualiyt = async () => {
    const { data } = await axios.get("https://localhost:7152/api/Quality/GetAll");
    setQualityOptions(data);
  };
  const fetchActress = async () => {
    const { data } = await axios.get("https://localhost:7152/api/Actress/GetAll");
    setActressOptions(data);
  };

  const renderSuccessSB = (
    <MDSnackbar
      color="success"
      icon="check"
      content="Movie is created"
      dateTime="2 second agp"
      open={successSB}
      onClose={closeSuccessSB}
      close={closeSuccessSB}
      bgWhite
    />
  );

  const handleSubmit = async (values) => {
    console.log(values);
    // const { data } = await axios.post("https://localhost:7152/api/Movie/Create", values);
    // if (data.errors === null) {
    //   setSuccessSB(true);
    //   setTimeout(() => {
    //     navigate("/movies");
    //   }, 2000);
    // }
  };
  return (
    <>
      <h1 style={{ display: "flex", justifyContent: "center", alignItems: "center" }}>
        Movie Create Form
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
            description: "",
            genreId: "",
            qualityIds: "",
            actressIds: "",
            year: "",
            file: "",
          }}
          validationSchema={validationSchema}
          onSubmit={handleSubmit}
        >
          <Form>
            <div className="form-group">
              <label htmlFor="name" className="form-label">
                Name
              </label>
              <Field type="text" name="name" id="name" className="form-control" />
              <ErrorMessage name="name" component="div" className="error-message" />
            </div>

            <div className="form-group">
              <label htmlFor="description" className="form-label">
                Description
              </label>
              <Field type="text" name="description" id="description" className="form-control" />
              <ErrorMessage name="description" component="div" className="error-message" />
            </div>

            <div className="form-group">
              <label htmlFor="selectedDate" className="form-label">
                Date
              </label>
              <Field type="date" name="selectedDate" id="selectedDate" className="form-control" />
              <ErrorMessage name="selectedDate" component="div" className="error-message" />
            </div>

            <div className="form-group">
              <label htmlFor="genre" className="form-label">
                Genre
              </label>
              {genreOptions ? (
                <Field as="select" name="genreId" id="genreId" className="form-control">
                  <option value="">Select a genre</option>
                  {genreOptions.map((option) => (
                    <option key={option.id} value={option.id}>
                      {option.name}
                    </option>
                  ))}
                </Field>
              ) : (
                ""
              )}
              <ErrorMessage name="genre" component="div" className="error-message" />
            </div>

            <div className="form-group">
              <label htmlFor="quality" className="form-label">
                Quality
              </label>
              {qualityOptions
                ? qualityOptions.map((option) => (
                    <div key={option} className="form-check">
                      <Field
                        type="checkbox"
                        name="qualityIds"
                        value={option.id}
                        id={option.id}
                        className="form-check-input"
                      />
                      <label htmlFor={option.name} className="form-check-label">
                        {option.name}
                      </label>
                    </div>
                  ))
                : ""}
              <ErrorMessage name="quality" component="div" className="error-message" />
            </div>

            <div className="form-group">
              <label htmlFor="actress" className="form-label">
                Actress
              </label>
              {actressOptions
                ? actressOptions.map((option, idx) => (
                    <div key={idx} className="form-check">
                      <Field
                        type="checkbox"
                        name="actressIds"
                        value={option.id}
                        id={option.id}
                        className="form-check-input"
                      />
                      <label htmlFor={option.fullName} className="form-check-label">
                        {option.fullName}
                      </label>
                    </div>
                  ))
                : ""}
              <ErrorMessage name="actress" component="div" className="error-message" />
            </div>
            <Field type="file" name="file" />

            <button type="submit">Submit</button>
          </Form>
        </Formik>
      </div>
    </>
  );
}

export default MovieCreate;
