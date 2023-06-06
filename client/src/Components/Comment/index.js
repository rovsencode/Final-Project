import React from "react";
import {
  MDBCard,
  MDBCardBody,
  MDBCardImage,
  MDBCol,
  MDBContainer,
  MDBIcon,
  MDBRow,
  MDBTypography,
  MDBBtn,
  MDBTextArea,
} from "mdb-react-ui-kit";
import "../Comment/index.scss";
function Comment() {
  return (
    <section style={{ backgroundColor: "#2B2B31" }}>
      <MDBContainer className="py-5" style={{ maxWidth: "1000px" }}>
        <MDBRow className="justify-content-center">
          <MDBCol md="12" lg="10">
            <MDBCard
              className="text-dark"
              style={{ backgroundColor: "#2b2b31" }}
            >
              <MDBCardBody className="p-4">
                <MDBTypography tag="h4" className="mb-0 text-white">
                  Recent comments
                </MDBTypography>
                <p className="fw-light mb-4 pb-2">
                  Latest Comments section by users
                </p>

                <div className="d-flex flex-start">
                  <MDBCardImage
                    className="rounded-circle shadow-1-strong me-3"
                    src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp"
                    alt="avatar"
                    width="60"
                    height="60"
                  />
                  <div>
                    <MDBTypography tag="h6" className="fw-bold mb-1 text-white">
                      Maggie Marsh
                    </MDBTypography>
                    <div className="d-flex align-items-center mb-3">
                      <p className="mb-0 text-white">March 07, 2021</p>
                      <a style={{ cursor: "pointer" }}>
                        <MDBIcon
                          fas
                          icon="trash"
                          style={{ color: "red", marginLeft: "5px" }}
                        />
                      </a>
                    </div>
                    <p className="mb-0 text-white">
                      Lorem Ipsum is simply dummy text of the printing and
                      typesetting industry. Lorem Ipsum has been the industry's
                      standard dummy text ever since the 1500s, when an unknown
                      printer took a galley of type and scrambled it.
                    </p>
                  </div>
                </div>
              </MDBCardBody>
              <hr className="my-0" />
            </MDBCard>
          </MDBCol>
        </MDBRow>
        <MDBRow className="comment-box">
          <MDBCol md="10" lg="8" xl="6">
            <MDBCard style={{ border: "none" }}>
              <MDBCardBody
                style={{ backgroundColor: "#2b2b31" }}
                className="p-4"
              >
                <div className="d-flex flex-start w-100">
                  <MDBCardImage
                    className="rounded-circle shadow-1-strong me-3"
                    src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(21).webp"
                    alt="avatar"
                    width="65"
                    height="65"
                  />

                  <div className="w-100">
                    <MDBTypography tag="h5" style={{ color: "white" }}>
                      Add a comment
                    </MDBTypography>
                    <MDBTextArea
                      style={{ backgroundColor: "#2b2b31", color: "white" }}
                      label={
                        <label style={{ color: "white" }}>
                          What is your view?
                        </label>
                      }
                      rows={4}
                    />
                    <div className="d-flex justify-content-center mt-3 ">
                      <MDBBtn color="success">
                        Send <MDBIcon fas icon="long-arrow-alt-right ms-1" />
                      </MDBBtn>
                    </div>
                  </div>
                </div>
              </MDBCardBody>
            </MDBCard>
          </MDBCol>
        </MDBRow>
      </MDBContainer>
    </section>
  );
}

export default Comment;
