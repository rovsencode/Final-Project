import React from "react";
import "../MovieDetailCard/index.scss";
import Icon from "@mdi/react";
import { mdiStar } from "@mdi/js";
import Comment from "../Comment";
function MovieDetailCard({
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
  trailer,
}) {
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
                    <span className="rating ">{rating}</span>
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
