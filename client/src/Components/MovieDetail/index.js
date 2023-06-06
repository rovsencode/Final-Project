import React, { useContext } from "react";
import MovieDetailCard from "../MovieDetailCard";
import "../MovieDetail/index.scss";
import ExpectedCard from "../ExpectedCard";
import { MovieContext } from "../../Contexts/movieContext";
import { useParams } from "react-router-dom";
import { movieService } from "../../APIs/Services/MovieService";
function MovieDetail() {
  const movies = useContext(MovieContext);
  const { movieId } = useParams();
  const [movie, setMovie] = React.useState();
  const fetchMovie = async () => {
    const { data } = await movieService.getMovie(movieId);
    setMovie(data);
    console.log(data);
  };
  React.useEffect(() => {
    fetchMovie();
  }, []);
  return (
    <section className="movie-detail">
      <div style={{ marginTop: "100px" }}>
        {movie ? (
          <MovieDetailCard
            key={movie.id}
            title={movie.name}
            poster={movie.imageUrl}
            rating={movie.raiting}
            quality={movie.qualities[0].name}
            ageRestriction={movie.ageRestriction}
            genres={movie.genre}
            releaseYear={movie.year}
            runningTime="120"
            country="USA"
            description={movie.description}
            trailer={movie.videoUrl}
          />
        ) : (
          ""
        )}
      </div>
      <div className="content__head">
        <div className="container">
          <div className="row">
            <div className="col-12">
              {movie ? <h2 className="content__title">{movie.name}</h2> : ""}
            </div>
            <div className="col-12 video-section ">
              <div className="movie-video" style={{width:"80%"}}>
                {movie ? (
                  <iframe
                    width="900px"
                    height="500px"
                    src="https://www.youtube.com/embed/z_iyiHdRL6A"
                    title="YouTube video player"
                    frameborder="0"
                    allow="autoplay; fullscreen; encrypted-media; picture-in-picture"
                  ></iframe>
                ) : (
                  ""
                )}
              </div>
              <div className="aside">
                <div className="aside-movies">
                  {movies
                    ? movies.slice(3,7).map((movie, idx) => (
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
