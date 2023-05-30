import React from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import * as Yup from "yup";
import { partnerService } from "../../APIs/Services/Partner";
import Partners from "../Partners";

const validationSchema = Yup.object().shape({
  file: Yup.mixed().required("Dosya seçimi zorunludur"),
});

function MovieForm() {
  const handleSubmit = (values) => {
    const { file } = values;
    const data = {
      title: "React",
      description: "react image upload",
      imageUrl: file,
    };

    console.log(data);
    console.log("success");
    // partnerService.postNewPost(data);
  };

  const handleFileChange = (event, setFieldValue) => {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onloadend = () => {
      setFieldValue("file", reader.result);
    };
    reader.readAsDataURL(file);
  };

  return (
    <div>
      <Formik
        initialValues={{
          file: "",
        }}
        validationSchema={validationSchema}
        onSubmit={handleSubmit}
      >
        {({ values, handleSubmit, setFieldValue }) => (
          <Form onSubmit={handleSubmit}>
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
    </div>
  );
}

export default MovieForm;
