import React from "react";
import Slider from "../../Components/Slider";
import NewItems from "../../Components/NewItems";
import Partners from "../../Components/Partners";
import ExpectedFilms from "../../Components/ExpectedFilms";
function Home() {
  return (
    <>
      <Slider />
      <ExpectedFilms />
      <NewItems />
      <Partners />
    </>
  );
}

export default Home;
