import React from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import * as Yup from "yup";
import { movieService } from "../../APIs/Services/MovieService";

const validationSchema = Yup.object().shape({
  file: Yup.mixed().required("Dosya seçimi zorunludur"),
});

function MovieForm() {
  const actressOptions = [1, 2]; 
  const qualityOptions = [6, 7, 8]; 
  const imageUrl ="https://storage.cloud.google.com/my-films-1207/Films/homealone2.jpeg";
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
            <div>
              <label htmlFor="name" style={{ color: "white" }}>
                Movie Name:
              </label>
              <Field type="text" name="name" id="name" />
            </div>
            <div>
              <label htmlFor="ageRestriction" style={{ color: "white" }}>
                Age Restriction
              </label>
              <Field type="text" name="ageRestriction" id="ageRestriction" />
            </div>
            <div>
              <label htmlFor="raiting" style={{ color: "white" }}>
                Rating
              </label>
              <Field type="number" name="raiting" id="rating" />
            </div>
            <div>
              <label htmlFor="year" style={{ color: "white" }}>
                Year
              </label>
              <Field type="date" name="year" id="year" />
            </div>
            <div>
              <label htmlFor="description" style={{ color: "white" }}>
                Description
              </label>
              <Field as="textarea" name="description" id="description" />
            </div>
            <div>
              <label htmlFor="genreId" style={{ color: "white" }}>
                Genre
              </label>
              <Field type="number" name="genreId" id="genreId" />
            </div>
            <div>
              <label htmlFor="actressIds" style={{ color: "white" }}>
                Actresses
              </label>
              <Field
                as="select"
                name="actressIds"
                id="actressIds"
                multiple={true}
              >
                {actressOptions.map((option) => (
                  <option key={option} value={option}>
                    {option}
                  </option>
                ))}
              </Field>
            </div>
            <div>
              <label htmlFor="qualityIds" style={{ color: "white" }}>
                Qualities
              </label>
              <Field
                as="select"
                name="qualityIds"
                id="qualityIds"
                multiple={true}
              >
                {qualityOptions.map((option) => (
                  <option key={option} value={option}>
                    {option}
                  </option>
                ))}
              </Field>
            </div>
            <div>
              <label htmlFor="price" style={{ color: "white" }}>
                Price
              </label>
              <Field type="number" name="price" id="price" />
            </div>
            <div>
              <label htmlFor="file-upload">Dosya seçin:</label>
              <input
                id="file-upload"
                type="file"
                name="file"
                onChange={(event) => handleFileChange(event, setFieldValue)}
              />
              <ErrorMessage name="file" component="div" />
            </div>
            <button type="submit">Yükle</button>
          </Form>
        )}
      </Formik>
      <img src={imageUrl} alt="Uploaded Image" />;
    </div>
  );
}

export default MovieForm;
