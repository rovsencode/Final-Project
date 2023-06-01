import React, { useState, useEffect, useContext } from "react";
import "../../Pages/Catalog/index.scss";
import background from "../../Pages/Catalog/section.jpg";
import { Button } from "primereact/button";
import { Tag } from "primereact/tag";
import { movieService } from "../../APIs/Services/MovieService";
import MovieCard from "../MovieCard";
import Carousel from "react-bootstrap/Carousel";
import ExpectedCard from "../ExpectedCard";
import "../ExpectedFilms/index.scss";
import { BeatLoader } from "react-spinners";
import { MovieContext } from "../../Contexts/movieContext";

function ExpectedFilms() {
  const [progress, setProgress] = useState(0);
  const [loading, setLoading] = useState(true);
  const movies = useContext(MovieContext);
  React.useEffect(() => {
    if (movies.length) {
      setLoading(false);
    }
  }, [movies]);
  return (
    <section
      className="section section--bg"
      style={{
        backgroundImage: `url(${background})`,
        backgroundSize: "cover",
        backgroundPosition: "center center",
        backgroundRepeat: "no-repeat",
      }}
    >
      <div className="container">
        <div className="row">
          {/* section title */}
          <div className="col-12">
            <h2 className="section__title">Expected premiere</h2>
          </div>
          {/* end section title */}
        </div>
        {loading ? (
          <div
            style={{
              display: "flex",
              justifyContent: "center",
              alignItems: "center",
            }}
          >
            <BeatLoader
              color="hsla(308, 67%, 53%, 1)"
              cssOverride={{}}
              loading
              margin={20}
              size={20}
              speedMultiplier={1}
            />
          </div>
        ) : (
          <Carousel>
            <Carousel.Item>
              <div
                className="d-flex justify-content-center"
                style={{ gap: "80px" }}
              >
                {movies.slice(0, 3).map((movie) => (
                  <ExpectedCard
                    key={movie.name}
                    name={movie.name}
                    imageUrl={movie.imageUrl}
                    genre={movie.genre}
                    rating={movie.raiting}
                  />
                ))}
              </div>
            </Carousel.Item>
            <Carousel.Item>
              <div
                className="d-flex justify-content-center"
                style={{ gap: "80px" }}
              >
                {movies.slice(3, 6).map((movie) => (
                  <ExpectedCard
                    key={movie.name}
                    name={movie.name}
                    imageUrl={movie.imageUrl}
                    genre={movie.genre}
                    rating={movie.raiting}
                  />
                ))}
              </div>
            </Carousel.Item>
            <Carousel.Item>
              <div
                className="d-flex justify-content-center"
                style={{ gap: "80px" }}
              >
                {movies.slice(6, 9).map((movie) => (
                  <ExpectedCard
                    key={movie.name}
                    name={movie.name}
                    imageUrl={movie.imageUrl}
                    genre={movie.genre}
                    rating={movie.raiting}
                  />
                ))}
              </div>
            </Carousel.Item>
          </Carousel>
        )}
        <style>
          {`
            .carousel-indicators {
              display: none;
            }
          `}
        </style>
      </div>
    </section>
  );
}
export default ExpectedFilms;
