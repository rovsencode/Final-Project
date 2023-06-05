import React from "react";
import "../MovieDetailCard/index.scss";
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
}) {
  return (
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
                <span className="quality">{quality}</span>
                <span className="age-restriction">{ageRestriction}</span>
                <span className="rating">{rating}</span>
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
          <video width="550px" src="https://storage.cloud.google.com/my-film-trailers/Trailers/1917%20-%20Official%20Trailer%20%5BHD%5D.mp4"></video>
        </div>
      </div>
    </div>
  );
}

export default MovieDetailCard;
