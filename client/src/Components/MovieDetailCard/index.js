import React from "react";
import "../MovieDetailCard/index.scss";
import Icon from "@mdi/react";
import { mdiStar } from "@mdi/js";
import Comment from "../Comment";
import { mdiThumbUpOutline } from "@mdi/js";
import { mdiThumbDownOutline } from "@mdi/js";
import { IconButton } from "@mui/material";
import { movieService } from "../../APIs/Services/MovieService";
function MovieDetailCard({
  movieId,
  title,
  poster,
  rating,
  quality,
  ageRestriction,
  genres,
  releaseYear,
  runningTime,
  country,
  description,
  likeActive,
  disLikeActive,
  trailer,
}) {
  const [like, setLike] = React.useState(likeActive);
  const [disLike, setDisLike] = React.useState(disLikeActive);
  const [movieRaiting, setMovieRaiting] = React.useState(
    Number(rating).toPrecision(2)
  );
  const handleLike = async () => {
    console.log("salam");
    const userName = localStorage.getItem("userName");
    const body = {
      userName: userName,
      id: movieId,
    };
    const { data } = await movieService.Like(body);
    console.log(data);
    setLike(data.likeActive);
    setDisLike(data.disLikeActive);
    setMovieRaiting(Number(data.raiting).toPrecision(2));
  };
  const handleDisLike = async () => {
    const userName = localStorage.getItem("userName");
    const body = {
      userName: userName,
      id: movieId,
    };
    const { data } = await movieService.DisLike(body);
    console.log(data);
    setLike(data.likeActive);
    setDisLike(data.disLikeActive);
    setMovieRaiting(Number(data.raiting).toPrecision(2));
  };
  return (
    <>
      <div className="container">
        <div className="row">
          <div className="movie-left">
            <h2 className="movie-title">{title}</h2>
            <div className="movie-card">
              <div className="movie-poster">
                <img src={poster} alt={title} />
              </div>
              <div className="movie-details">
                <div className="movie-info">
                  <div className="raiting-box ">
                    <Icon path={mdiStar} size={0.9} color="#ff55a5" />
                    <span className="rating ">{movieRaiting}</span>
                  </div>
                  <span className="quality">{quality}</span>
                  <span className="age-restriction">{ageRestriction}</span>
                </div>
                <p className="genres">
                  Genre: <span>{genres}</span>
                </p>
                <p className="release-year">Release year: {releaseYear}</p>
                <p className="running-time">Running time: {runningTime}</p>
                <p className="country">
                  Country: <span> {country}</span>
                </p>
                <p className="description">{description}</p>
              </div>
            </div>
            {likeActive !== undefined && disLikeActive !== undefined && (
              <>
                <IconButton onClick={handleLike}>
                  <Icon
                    color={like ? "blue" : "white"}
                    path={mdiThumbUpOutline}
                    size={1}
                  />
                </IconButton>

                <IconButton onClick={handleDisLike}>
                  <Icon
                    color={disLike ? "blue" : "white"}
                    path={mdiThumbDownOutline}
                    size={1}
                  />
                </IconButton>
              </>
            )}
          </div>
          <div className="movie-right">
            <video
              width="550px"
              controls
              src={trailer}
              type="video/mp4"
            ></video>
          </div>
        </div>
      </div>
    </>
  );
}

export default MovieDetailCard;
