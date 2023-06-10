import React, { useContext } from "react";
import MovieDetailCard from "../MovieDetailCard";
import "../MovieDetail/index.scss";
import ExpectedCard from "../ExpectedCard";
import { MovieContext } from "../../Contexts/movieContext";
import { useNavigate, useParams } from "react-router-dom";
import { movieService } from "../../APIs/Services/MovieService";
import Comment from "../Comment";
function MovieDetail() {
  const navigate = useNavigate();
  const movies = useContext(MovieContext);
  const { movieId } = useParams();
  const [movie, setMovie] = React.useState();
  const handleNavigate = (newMovieId) => {
    const currentUrl = window.location.pathname;
    const baseRoute = currentUrl.split("/movies")[0];
    navigate(`${baseRoute}/movies/${newMovieId}`);
  };
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
              <div className="movie-video" style={{ width: "80%" }}>
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
                    ? movies.slice(3, 7).map((movie, idx) => (
                        <div key={idx} className="movie">
                          <li
                            onClick={() => {
                              handleNavigate(movie.id);
                            }}
                          >
                            <ExpectedCard
                              name={movie.name}
                              imageUrl={movie.imageUrl}
                            />
                          </li>
                        </div>
                      ))
                    : ""}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <Comment />
    </section>
  );
}

export default MovieDetail;
