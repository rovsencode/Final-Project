import React from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import * as Yup from "yup";
import { Button, Grid } from "@mui/material";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import MDSnackbar from "components/MDSnackbar";
import "react-datetime/css/react-datetime.css";
const validationSchema = Yup.object().shape({
  // name: Yup.mixed().required("Name is required"),
  // description: Yup.mixed().required("Description is required"),
  // qualityIds: Yup.mixed().required("Quality is required"),
  // genreId: Yup.mixed().required("genre is required"),
  // imageUrl: Yup.mixed().required("imageUrl is required"),
  // ageRestriction: Yup.mixed().required("Quality is required"),
  // raiting: Yup.mixed().required("raiting is required"),
  // backgroundImage: Yup.mixed().required("backgroundImage is required"),
  // videoUrl: Yup.mixed().required("videoUrl is required"),
});

function MovieCreate() {
  const [raiting, setRaiting] = React.useState([5]);
  const handleSliderChange = (event, newRaiting) => {
    setRaiting(newRaiting);
  };
  React.useEffect(() => {
    fetchGenre();
    fetchQualiyt();
  }, []);
  const navigate = useNavigate();
  const handleClick = () => {
    navigate("/movie");
  };

  const [successSB, setSuccessSB] = React.useState(false);
  const closeSuccessSB = () => setSuccessSB(false);
  const [genreOptions, setGenreOptions] = React.useState([]);
  const [qualityOptions, setQualityOptions] = React.useState([]);

  const fetchGenre = async () => {
    const { data } = await axios.get("https://flixgo-001-site1.ctempurl.com/api/Genre/GetAll");
    setGenreOptions(data);
  };
  const fetchQualiyt = async () => {
    const { data } = await axios.get("https://flixgo-001-site1.ctempurl.com/api/Quality/GetAll");
    setQualityOptions(data);
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
  const [imageData, setImageData] = React.useState(null);
  const [backImageData, setBackImageData] = React.useState(null);
  const [videoData, setVideoData] = React.useState(null);
  const handleImageChange = (event) => {
    setImageData(event.target.files[0]);
  };
  const handleBackImageChange = (event) => {
    setBackImageData(event.target.files[0]);
  };
  const handleVideoChange = (event) => {
    setVideoData(event.target.files[0]);
  };
  const handleSubmit = async (values) => {
    const formData = new FormData();
    formData.append("name", values.name);
    formData.append("ImageUrl", imageData);
    formData.append("videoUrl", videoData);
    formData.append("backgroundImage", backImageData);
    formData.append("description", values.description);
    formData.append("ageRestriction", values.ageRestriction);
    formData.append("raiting", values.raiting);
    formData.append("description", values.description);
    formData.append("genreId", values.genreId);
    values.qualityIds.forEach((id) => {
      formData.append("qualityIds[]", id);
    });
    formData.append("year", values.year);

    console.log(values);

    const { data } = await axios.post("https://localhost:7152/api/Movie/Create", formData, {
      headers: {
        "Content-Type": "multipart/form-data",
      },
      maxBodyLength: 5000 * 1024 * 1024,
    });
    console.log(data.statusCode);
    if (data.errors === null) {
      setSuccessSB(true);
      setTimeout(() => {
        navigate("/movie");
      }, 2000);
    }
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
            genreId: [],
            qualityIds: [],
            year: "",
            imageUrl: "",
            backgroundImage: "",
            videoUrl: "",
            raiting: "",
            ageRestriction: "",
          }}
          validationSchema={validationSchema}
          onSubmit={handleSubmit}
        >
          {({ handleSubmit, setFieldValue, values }) => (
            <Form style={{ marginLeft: "250px" }} onSubmit={handleSubmit}>
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
                <label htmlFor="ageRestriction" className="form-label">
                  AgeRestriction
                </label>
                <Field
                  type="text"
                  name="ageRestriction"
                  id="ageRestriction"
                  className="form-control"
                />
                <ErrorMessage name="ageRestriction" component="div" className="error-message" />
              </div>
              <div className="form-group">
                <label htmlFor="year" className="form-label">
                  Date
                </label>
                <Field type="date" name="year" id="selectedDate" className="form-control" />
                <ErrorMessage name="year" component="div" className="error-message" />
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
                <label htmlFor="qualityIds" className="form-label">
                  Quality
                </label>
                {qualityOptions ? (
                  <>
                    {qualityOptions.map((quality, idx) => (
                      <div key={idx} className="form-check">
                        <Field
                          name="qualityIds"
                          type="checkbox"
                          value={quality.id}
                          id={`quality${quality.id}`}
                          checked={values.qualityIds.includes(quality.id)}
                          onChange={(e) => {
                            const checked = e.target.checked;
                            const value = quality.id;

                            if (checked) {
                              setFieldValue("qualityIds", [...values.qualityIds, value]);
                            } else {
                              setFieldValue(
                                "qualityIds",
                                values.qualityIds.filter((val) => val !== value)
                              );
                            }
                          }}
                        />
                        <label htmlFor={quality.id} className="form-check-label">
                          {quality.name}
                        </label>
                      </div>
                    ))}
                  </>
                ) : (
                  ""
                )}
                <ErrorMessage name="qualityIds" component="div" className="error-message" />{" "}
              </div>

              <div className="form-group">
                <label htmlFor="raiting">Imdb:</label>
                <Field
                  type="number"
                  name="raiting"
                  id="numberInput"
                  className="form-control"
                  max="10"
                />
              </div>
              <ErrorMessage name="raiting" component="div" className="error-message" />
              <span>Image: </span>
              <input type="file" onChange={handleImageChange} accept="image/*" name="imageUrl" />
              <span>BackgroundImage: </span>
              <input type="file" onChange={handleBackImageChange} name="backgroundImage" />
              <span>Video: </span>
              <input type="file" onChange={handleVideoChange} name="videoUrl" />
              <Button
                style={{
                  marginTop: "10px",

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
export default MovieCreate;
