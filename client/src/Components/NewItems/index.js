import { useState } from "react";
import * as React from "react";
import Tabs from "@mui/material/Tabs";
import Tab from "@mui/material/Tab";
import Box from "@mui/material/Box";
import MovieCard from "../MovieCard";
import { Grid } from "@mui/material";
import { MovieContext } from "../../Contexts/movieContext";
import "../NewItems/index.scss";
const split = {
  title: "split",
  description: "psixlosjdkffdasijkldsfjlsjfkjsofkjdofsjajdfsmjmjdsafmm",
};
const datas = {
  newRelases: ["actrees", "films", "series"],
  series: [split],
  movies: ["spiderman", "split", "batman"],
  cartoons: ["tom and jerry", "minions"],
};
export default function ColorTabs() {
  const movies = React.useContext(MovieContext);
  React.useEffect(() => {}, []);
  const [tab, setTab] = React.useState(null);
  const handleClick = (e) => {
    if (e.target.name === "series") {
      console.log("success");
      console.log(datas.series);
      // // set(datas.series);
    }
    if (e.target.name === "movies") {
      console.log("success");
      // setMovie(datas.movies);
    }
    if (e.target.name === "newRelases") {
      console.log("success");
      // // setMovie(datas.newRelases);
    }
  };
  const [value, setValue] = React.useState("one");

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  return (
    <div>
      <Box
        className="box"
        sx={{ width: "100%", display: "flex", justifyContent: "center" }}
      >
        <Tabs
          className="tabs"
          value={value}
          onChange={handleChange}
          textColor="secondary"
          indicatorColor="secondary"
          aria-label="secondary tabs example"
        >
          <Tab
            sx={{
              color: "white",
              textAlign: "center",
              marginTop: "20px",
              fontSize: "1.2rem",
            }}
            value="one"
            name="newRelases"
            onClick={handleClick}
            label="  NEW RELEASES"
          />
          <Tab
            sx={{
              color: "white",
              textAlign: "center",
              marginTop: "20px",
              fontSize: "1.2rem",
            }}
            value="two"
            name="movies"
            onClick={handleClick}
            label="MOVIES"
          />
          <Tab
            sx={{
              color: "white",
              textAlign: "center",
              marginTop: "20px",
              fontSize: "1.2rem",
            }}
            className="tab"
            value="three"
            name="series"
            onClick={handleClick}
            label="TV SERIES"
          />
        </Tabs>
      </Box>
      <Grid container spacing={2}>
        {movies.slice(0,6).map((movie, index) => (
          <Grid item xs={12} sm={6} md={4} lg={3} key={index}>
            <MovieCard
              key={movie.index}
              title={movie.name}
              description={movie.description}
              imageUrl={movie.imageUrl}
              action={movie.genre}
              rating={movie.raiting}
              ageRestriction={movie.ageRestriction}
              quality={movie.quality}
              Year={movie.Year}
            />
          </Grid>
        ))}
      </Grid>
    </div>
  );
}
