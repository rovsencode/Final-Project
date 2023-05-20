import React, { useState } from "react";
import { Dropdown } from "primereact/dropdown";
import Submit from "../../Components/Submit";
import { Grid, Slider, colors } from "@mui/material";
import { Stack } from "@mui/material";
import { Pagination } from "@mui/material";
import "../Catalog/index.scss";
import background from "../Catalog/section.jpg";
import { genreService } from "../../APIs/Services/GenreService";
import { qualityService } from "../../APIs/Services/QualityService";
import { Button, Container } from "react-bootstrap";
import { movieService } from "../../APIs/Services/MovieService";
import MovieCard from "../../Components/MovieCard";
import { click } from "@testing-library/user-event/dist/click";

function Catalog() {
  const [deger, setDeger] = useState([0, 5]);

  const handleSliderChange = (event, newValue) => {
    setDeger(newValue);
  };
  const [yearFil, setYearFil] = useState([2000, 2015]);

  const handleSliderYear = (event, newValue) => {
    setYearFil(newValue);
  };
  const [pageCount, setPageCount] = React.useState([]);
  const [selectedGenre, setSelectedGenre] = React.useState([]);
  const [genres, setGenres] = React.useState([]);
  const [selectedQualty, setSelectedQualty] = React.useState([]);
  const [qualtys, setQualtys] = React.useState();
  const [movies, setMovies] = React.useState([]);
  const [skip, setSkip] = React.useState(0);
  const [page, setPage] = React.useState([]);
  const [count, setCount] = React.useState(1);
  const fetchMovie = async () => {
    console.log("success data");
    const { data } = await movieService.skip(skip);
    setCount(count + 1);
    setSkip(10 * page);

    if (count === pageCount) {
      console.log("sifirlandi");
      setCount(0);
      setSkip(0);
    }

    console.log(data);

    setMovies(data); // Yeni filmleri güncelle
  };

  // React.useEffect(()=>{},[])
  const handlePageChange = (event, page) => {
    setPage(page);
    fetchMovie();
  };

  const click = () => {
    console.log("success");
  };
  React.useEffect(() => {
    const fetchGenre = async () => {
      const { data } = await genreService.getAll();
      setGenres(data);
    };
    const fetchCount = async () => {
      const { data } = await movieService.getCount();
      setPageCount(data);
      console.log(data);
    };
    const fetchQuality = async () => {
      const { data } = await qualityService.getAll();
      setQualtys(data);
    };
    fetchCount();
    fetchGenre();
    fetchQuality();
    fetchMovie();
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
                <h2 className="section__title">Catalog</h2>
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
                        <div id="filter__imbd-start">{deger[0]} </div>
                        <div id="filter__imbd-end">{deger[1]}</div>
                      </div>
                      <span></span>
                    </div>
                    <div>
                      <Slider
                        style={{ width: "150px" }}
                        value={deger}
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
                        <div id="filter__years-start">{yearFil[0]}</div>
                        <div id="filter__years-end">{yearFil[1]}</div>
                      </div>
                      <span />
                    </div>
                    <div>
                      <Slider
                        style={{ width: "150px" }}
                        value={yearFil}
                        onChange={handleSliderYear}
                        valueLabelDisplay="auto"
                        aria-labelledby="range-slider"
                        min={2000}
                        max={2020}
                      />
                    </div>
                  </div>
                  {/* end filter item */}
                </div>
                {/* filter btn */}
                <button className="filter__btn" type="button">
                  apply filter
                </button>
                {/* end filter btn */}
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="movies">
        <Grid container spacing={2}>
          {movies.map((movie) => (
            <Grid item xs={12} sm={6} md={4} lg={3}>
              <MovieCard
                key={movie.title}
                title={movie.title}
                description={movie.description}
                imageUrl={movie.imageUrl}
                action={movie.action}
                rating={movie.rating}
                ageRestriction={movie.ageRestriction}
                Year={movie.Year}
              />
            </Grid>
          ))}
        </Grid>
      </div>
      <Button onClick={fetchMovie}>click</Button>
      <div className="text-center" style={{ marginLeft: "500px" }}>
        <Pagination
          count={pageCount + 1}
          onChange={fetchMovie}
          color="secondary"
        />
      </div>
    </>
  );
}

export default Catalog;
