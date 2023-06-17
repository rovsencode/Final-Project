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
    window.location.reload();
  };

  const fetchMovie = async () => {
    const userName = localStorage.getItem("userName");
    const body = {
      movieId: movieId,
      userName: userName,
    };
    const { data } = await movieService.getOne(body);
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
            movieId={movie.id}
            title={movie.name}
            poster={movie.imageUrl}
            rating={movie.raiting}
            ageRestriction={movie.ageRestriction}
            genres={movie.genre}
            quality={movie.qualities[0].name}
            releaseYear={movie.year}
            runningTime="120"
            country="USA"
            likeActive={movie.likeActive}
            disLikeActive={movie.dislikeActive}
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
                <Comment movieId={movieId} />
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
    </section>
  );
}

export default MovieDetail;
