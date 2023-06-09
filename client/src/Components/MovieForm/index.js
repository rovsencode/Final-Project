import React from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import * as Yup from "yup";
import { movieService } from "../../APIs/Services/MovieService";

const validationSchema = Yup.object().shape({
  file: Yup.mixed().required("File is choosen"),
});

function MovieForm() {
  const actressOptions = [1, 2];
  const qualityOptions = [6, 7, 8];
  const genreOptions = ["horror", "comedy"];
  const imageUrl =
    "https://storage.cloud.google.com/my-films-1207/Films/homealone2.jpeg";
  const handleSubmit = (values) => {
    const {
      name,
      description,
      file,
      ageRestriction,
      year,
      raiting,
      price,
      actressIds,
      qualityIds,
      genreId,
      videoUrl,
    } = values;

    const form = {
      name: name,
      description: description,
      imageUrl: file,
      ageRestriction: ageRestriction,
      year: year,
      raiting: raiting,
      price: price,
      actressIds: actressIds,
      qualityIds: qualityIds,
      genreId: genreId,
      videoUrl: videoUrl,
    };
    console.log(form);
    const createForm = async () => {
      const { data } = await movieService.create(form);
      console.log(data);
      console.log("success");
    };
    createForm();
  };

  const handleFileChange = (event, setFieldValue) => {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onloadend = () => {
      const base64Data = reader.result.split(",")[1]; // Base64 verisini al
      setFieldValue("file", base64Data);
    };
    reader.readAsDataURL(file);
  };

  return (
    <div style={{ marginTop: "200px", marginLeft: "200px" }}>
      <Formik
        initialValues={{
          file: "",
          actressIds: [],
          qualityIds: [],
        }}
        validationSchema={validationSchema}
        onSubmit={handleSubmit}
      >
        {({ values, handleSubmit, setFieldValue }) => (
          <Form onSubmit={handleSubmit}>
            <div className="form-group" style={{ width: "400px" }}>
              <label
                style={{ color: "white" }}
                htmlFor="name"
                className="form-label"
              >
                Movie Name:
              </label>
              <Field
                type="text"
                name="name"
                id="name"
                className="form-control"
              />
            </div>
            <div className="form-group" style={{ width: "400px" }}>
              <label
                style={{ color: "white" }}
                htmlFor="description"
                className="form-label"
              >
                Description:
              </label>
              <Field
                as="textarea"
                name="description"
                id="description"
                className="form-control"
              />
            </div>
            <div className="form-group" style={{ width: "400px" }}>
              <label
                style={{ color: "white" }}
                htmlFor="ageRestriction"
                className="form-label"
              >
                AgeRestriction:
              </label>
              <Field
                type="text"
                name="ageRestriction"
                id="ageRestriction"
                className="form-control"
              />
            </div>
            <div className="form-group" style={{ width: "400px" }}>
              <label
                style={{ color: "white" }}
                htmlFor="genreOptions"
                className="form-label"
              >
                Genre
              </label>
              <Field
                as="select"
                name="genreOptions"
                id="genreOptions"
                className="form-control"
              >
                <option value="">Select a genre</option>
                {genreOptions.map((option) => (
                  <option key={option} value={option}>
                    {option}
                  </option>
                ))}
              </Field>
            </div>
            <div className="form-group" style={{ width: "400px" }}>
              <label style={{ color: "white" }} className="form-label">
                Genre
              </label>
              {qualityOptions.map((option) => (
                <div key={option} className="form-check">
                  <Field
                    type="checkbox"
                    name="qualityOptions"
                    value={option}
                    id={`qualityOptions${option}`}
                    className="form-check-input"
                  />
                  <label
                    htmlFor={`qualityOption${option}`}
                    className="form-check-label"
                  >
                    {option}
                  </label>
                </div>
              ))}
            </div>

            {/* <div className="form-group">
              <label htmlFor="file-upload">Dosya seçin:</label>
              <input
                id="file-upload"
                type="file"
                name="file"
                onChange={(event) => handleFileChange(event, setFieldValue)}
                className="form-control-file"
              />
              <ErrorMessage
                name="file"
                component="div"
                className="error-message"
              />
            </div> */}
            <button
              style={{ marginTop: "10px" }}
              type="submit"
              className="btn btn-primary"
            >
              Submit
            </button>
          </Form>
        )}
      </Formik>
    </div>
  );
}

export default MovieForm;
