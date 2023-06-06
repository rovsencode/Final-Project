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
import { commentService } from "../../APIs/Services/CommentService";
import "../Comment/index.scss";
function Comment() {
  const [comments, setComments] = React.useState([]);
  const [message, setMessage] = React.useState("");
     const fetchComment = async () => {
       const { data } = await commentService.getComments();
       setComments(data);
       console.log(data);
     };
    React.useEffect(() => {
      fetchComment();
    }, []);
  const handleSubmit = async () => {
    const comment = {
      message: message,
      movieId: 1024,
      userName: localStorage.getItem("userName"),
    };
    const { data } = await commentService.addComment(comment);
    if (data.statusCode === 201) {
      fetchComment();
      
    }
    console.log(data);
  };
  const onChangeComment = (event) => {
    setMessage(event.target.value);
  };
  const handleDelete = async (id) => {
    console.log(id);
    const { data } = await commentService.deleteComment(id);
    console.log(data);
    console.log(data.statusCode);
    if (data.statusCode === 200) {
      setComments((prevComments) =>
        prevComments.filter((comment) => comment.commentId !== id)
      );
    }
  };

  return (
    <section style={{ backgroundColor: "#2B2B31" }}>
      <MDBContainer
        className="py-5 comment-container"
        style={{ maxWidth: "1000px" }}
      >
        <MDBRow className="justify-content-center">
          <MDBCol md="12" lg="10">
            <MDBCard
              className="text-dark"
              style={{ backgroundColor: "#2b2b31" }}
            >
              <MDBTypography tag="h4" className="mb-0 text-white">
                Recent comments
              </MDBTypography>
              {comments
                ? comments.map((comment, idx) => (
                    <MDBCardBody key={idx} className="p-4">
                      <div className="d-flex flex-start">
                        <MDBCardImage
                          className="rounded-circle shadow-1-strong me-3"
                          src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp"
                          alt="avatar"
                          width="60"
                          height="60"
                        />
                        <div>
                          <MDBTypography
                            tag="h6"
                            className="fw-bold mb-1 text-white"
                          >
                            {comment.userName}
                          </MDBTypography>
                          <div className="d-flex align-items-center mb-3">
                            <p className="mb-0 text-white">
                              {comment.createdTime}
                            </p>
                            {comment.userName ===
                            localStorage.getItem("userName") ? (
                              <li
                                onClick={() => handleDelete(comment.commentId)}
                                style={{ cursor: "pointer" }}
                              >
                                <MDBIcon
                                  fas
                                  icon="trash"
                                  style={{ color: "red", marginLeft: "5px" }}
                                />
                              </li>
                            ) : (
                              ""
                            )}
                          </div>
                          <p className="mb-0 text-white">{comment.message}</p>
                        </div>
                      </div>
                    </MDBCardBody>
                  ))
                : ""}

              <hr className="my-0" />
            </MDBCard>
          </MDBCol>
        </MDBRow>
        {localStorage.getItem("userName") ? (
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
                        value={message}
                        onChange={onChangeComment}
                        style={{ backgroundColor: "#2b2b31", color: "white" }}
                        label={
                          <label style={{ color: "white" }}>
                            What is your view?
                          </label>
                        }
                        rows={4}
                      />
                      <div className="d-flex justify-content-center mt-3 ">
                        <MDBBtn color="success" onClick={handleSubmit}>
                          Send <MDBIcon fas icon="long-arrow-alt-right ms-1" />
                        </MDBBtn>
                      </div>
                    </div>
                  </div>
                </MDBCardBody>
              </MDBCard>
            </MDBCol>
          </MDBRow>
        ) : (
          <p
            style={{ fontSize: "17px", marginLeft: "100px" }}
            className="text-danger"
          >
            Only users add comment ,please sign in or sign up
          </p>
        )}
      </MDBContainer>
    </section>
  );
}

export default Comment;
