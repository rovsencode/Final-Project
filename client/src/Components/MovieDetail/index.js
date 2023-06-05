import React from "react";
import MovieDetailCard from "../MovieDetailCard";
function MovieDetail() {
  return (
    <div style={{ marginTop: "100px" }}>
      <MovieDetailCard
        title="kino"
        poster="/img/covers/cover.jpg"
        rating="9"
        quality="12"
        ageRestriction="15"
        genres="horror"
        releaseYear="2012"
        runningTime="120"
        country="azerbaijan"
        description="film 14809jfdslsffadsnflkas nfalksksdfads "
        trailer="video"
      />
    </div>
  );
}

export default MovieDetail;
