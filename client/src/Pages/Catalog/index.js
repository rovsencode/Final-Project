import React, { useState } from "react";
import { Dropdown } from "primereact/dropdown";
import { Grid, Slider } from "@mui/material";
import { Pagination } from "@mui/material";
import "../Catalog/index.scss";
import background from "../Catalog/section.jpg";
import { genreService } from "../../APIs/Services/GenreService";
import { qualityService } from "../../APIs/Services/QualityService";
import { Button } from "react-bootstrap";
import MovieCard from "../../Components/MovieCard";
import { movieService } from "../../APIs/Services/MovieService";
import "primereact/resources/primereact.min.css";
import "primereact/resources/themes/lara-light-indigo/theme.css";
import { useNavigate } from "react-router-dom";
function Catalog() {
  const [raiting, setRaiting] = useState([0, 5]);
  const [year, setYear] = useState([undefined, undefined]);
  const [rangeYear, setRangeYear] = React.useState([]);
  const [pageCount, setPageCount] = React.useState(0);
  const [selectedGenre, setSelectedGenre] = React.useState([]);
  const [genres, setGenres] = React.useState([]);
  const [selectedQualty, setSelectedQualty] = React.useState([]);
  const [qualtys, setQualtys] = React.useState();
  const [movies, setMovies] = React.useState([]);
  const navigate = useNavigate();
  const handleMovieClick = (movieId) => {
    navigate(`/movies/${movieId}`);
  };
  const handleReset = () => {
    setSelectedGenre([]);
    setSelectedQualty([]);
    setYear([undefined, undefined]);
    setRaiting([0, 5]);
    fetchMovie(1);
    fetchCount();
  };
  const fetchMovie = async (page) => {
    console.log("normalpage: " + page);
    const { data } = await movieService.skip(page);
    console.log(data);
    setMovies(data);
  };
  const fetchCount = async () => {
    const { data } = await movieService.getCount();
    setPageCount(Math.ceil(data));
    console.log(data);
  };

  const handlePageChange = (event, page) => {
    console.log("Handlepage: " + page);
    fetchMovie(page);
  };
  const handleSliderChange = (event, newRaiting) => {
    setRaiting(newRaiting);
  };

  const handleSliderYear = (event, newYear) => {
    setYear(newYear);
  };

  const filterFetch = async (params) => {
    const { data } = await movieService.filterSort(params);
    setMovies(data);
    setPageCount(Math.ceil(data.length / 10));
    console.log(data);
  };
  const handleFilter = () => {
    let params = "";
    if (selectedGenre.name !== undefined) {
      params += `genre=${selectedGenre.name}&`;
    }
    if (raiting !== undefined) {
      params += `raiting=${raiting[0]}&raiting=${raiting[1]}&`;
    }
    if (selectedQualty.name !== undefined) {
      params += `quality=${selectedQualty.name}&`;
    }
    if (year[0] !== undefined && year[1] !== undefined) {
      params += `year=${year[0]}&year=${year[1]}&`;
    }
    filterFetch(params);
  };

  React.useEffect(() => {
    const fetchGenre = async () => {
      const { data } = await genreService.getAll();
      setGenres(data);
    };

    const getYear = async () => {
      const { data } = await movieService.getYear();
      const { minYear, maxYear } = data;
      setRangeYear([minYear, maxYear]);
      console.log(data);
    };

    const fetchQuality = async () => {
      const { data } = await qualityService.getAll();
      setQualtys(data);
    };
    getYear();
    fetchCount();
    fetchGenre();
    fetchQuality();
    fetchMovie(1);
  }, []);

  return (
    <>
      <section
        className="section catalog section--first section--bg"
        style={{
          backgroundImage: `url(${background})`,

          backgroundSize: "cover",
          backgroundPosition: "center center",
          backgroundRepeat: "no-repeat",
        }}
      >
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div
                className="section__wrap"
                style={{
                  display: "flex",
                  textAlign: "center",
                  justifyContent: "center",
                }}
              >
                {/* section title */}
                <h2 className="section__title">Movies</h2>
                {/* end section title */}
                {/* breadcrumb */}
                {/* <ul className="breadcrumb">
                  <li className="breadcrumb__item"><a href="#">Home</a></li>
                  <li className="breadcrumb__item breadcrumb__item--active">Catalog grid</li>
                </ul> */}
                {/* end breadcrumb */}
              </div>
            </div>
          </div>
        </div>
      </section>

      <div className="filter">
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="filter__content">
                <div className="filter__items">
                  {/* filter item */}
                  <div className="filter__item" id="filter__genre">
                    <span className="filter__item-label">GENRE:</span>
                    <Dropdown
                      value={selectedGenre}
                      onChange={(e) => setSelectedGenre(e.value)}
                      options={genres}
                      optionLabel="name"
                      showClear
                      placeholder="Select a genre"
                      className="w-full md:w-14rem"
                      style={{ backgroundColor: "#2B2B31", color: "white" }}
                    />{" "}
                  </div>
                  {/* end filter item */}
                  {/* filter item */}
                  <div className="filter__item" id="filter__quality">
                    <span className="filter__item-label">QUALITY:</span>
                    <Dropdown
                      value={selectedQualty}
                      onChange={(e) => setSelectedQualty(e.value)}
                      options={qualtys}
                      optionLabel="name"
                      showClear
                      placeholder="Select a quality"
                      className="w-full md:w-14rem"
                      style={{ backgroundColor: "#2B2B31", color: "white" }}
                    />
                  </div>
                  {/* end filter item */}
                  {/* filter item */}
                  <div className="filter__item" id="filter__rate">
                    <span className="filter__item-label">IMBd:</span>
                    <div
                      className="filter__item-btn dropdown-toggle"
                      role="button"
                      id="filter-rate"
                      data-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      <div className="filter__range">
                        <div id="filter__imbd-start">{raiting[0]} </div>
                        <div id="filter__imbd-end">{raiting[1]}</div>
                      </div>
                      <span></span>
                    </div>
                    <div>
                      <Slider
                        style={{ width: "150px" }}
                        value={raiting}
                        onChange={handleSliderChange}
                        valueLabelDisplay="auto"
                        aria-labelledby="range-slider"
                        min={0}
                        max={10}
                      />
                    </div>
                    <div
                      className="filter__item-menu filter__item-menu--range dropdown-menu"
                      aria-labelledby="filter-rate"
                    >
                      <div id="filter__imbd" />
                    </div>
                  </div>
                  {/* end filter item */}
                  {/* filter item */}
                  <div className="filter__item" id="filter__year">
                    <span className="filter__item-label">RELEASE YEAR:</span>
                    <div
                      className="filter__item-btn dropdown-toggle"
                      role="button"
                      id="filter-year"
                      data-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      <div className="filter__range">
                        <div id="filter__years-start">{year[0]}</div>
                        <div id="filter__years-end">{year[1]}</div>
                      </div>
                      <span />
                    </div>
                    <div>
                      <Slider
                        style={{ width: "150px" }}
                        value={year}
                        onChange={handleSliderYear}
                        valueLabelDisplay="auto"
                        aria-labelledby="range-slider"
                        min={rangeYear[0]}
                        max={rangeYear[1]}
                      />
                    </div>
                  </div>
                  {/* end filter item */}
                </div>
                {/* filter btn */}
                <button
                  onClick={handleFilter}
                  className="filter__btn"
                  type="button"
                >
                  apply filter
                </button>
                <button
                  onClick={handleReset}
                  className="filter__btn"
                  type="button"
                >
                  reset
                </button>
                {/* end filter btn */}
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="movies">
        <Grid container spacing={2}>
          {movies.map((movie, idx) => (
            <Grid key={idx} item xs={12} sm={6} md={4} lg={3}>
              <li key={idx} onClick={() => handleMovieClick(movie.id)}>
                {" "}
                <MovieCard
                  key={movie.id}
                  title={movie.name}
                  description={movie.description}
                  imageUrl={movie.imageUrl}
                  quality={movie.qualities[0].name}
                  action={movie.genre}
                  rating={movie.raiting}
                  ageRestriction={movie.ageRestriction}
                  Year={movie.year}
                />
              </li>
            </Grid>
          ))}
        </Grid>
      </div>
      <Button onClick={handleMovieClick}>click</Button>

      <div className="text-center" style={{ marginLeft: "500px" }}>
        <Pagination
          count={pageCount}
          onChange={handlePageChange}
          color="secondary"
        />
      </div>
    </>
  );
}

export default Catalog;
