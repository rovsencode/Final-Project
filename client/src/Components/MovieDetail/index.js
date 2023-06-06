import React, { useContext } from "react";
import MovieDetailCard from "../MovieDetailCard";
import "../MovieDetail/index.scss";
import ExpectedCard from "../ExpectedCard";
import { MovieContext } from "../../Contexts/movieContext";
function MovieDetail() {
  const movies = useContext(MovieContext);
  return (
    <section className="movie-detail">
      <div style={{ marginTop: "100px" }}>
        <MovieDetailCard
          title="Split"
          poster="/img/covers/cover.jpg"
          rating="8.4"
          quality="HD"
          ageRestriction="16+"
          genres="horro"
          releaseYear="2012"
          runningTime="120"
          country="USA"
          description="Though Kevin (James McAvoy) has evidenced 23 personalities to his trusted psychiatrist, Dr. Fletcher (Betty Buckley), there remains one still submerged who is set to materialize and dominate all of the others. Compelled to abduct three teenage girls led by the willful, observant Casey, Kevin reaches a war for survival among all of those contained within him -- as well as everyone around him -- as the walls between his compartments shatter."
          trailer="video"
        />
      </div>
      <div className="content__head">
        <div className="container">
          <div className="row">
            <div className="col-12">
              <h2 className="content__title">Discover</h2>
            </div>
            <div className="col-12 video-section ">
              <div className="movie-video">
                <video style={{ width: "90%" }}>
                  <source
                    src="https://storage.cloud.google.com/my-film-trailers/Trailers/1917%20-%20Official%20Trailer%20%5BHD%5D.mp4"
                    type="video/mp4"
                  />
                </video>
              </div>
              <div className="aside">
                <div className="aside-movies">
                  {movies
                    ? movies.slice(0, 4).map((movie, idx) => (
                        <div key={idx} className="movie">
                          <ExpectedCard
                            name={movie.name}
                            imageUrl={movie.imageUrl}
                          />
                        </div>
                      ))
                    : ""}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

export default MovieDetail;
