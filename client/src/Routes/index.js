import React from "react";
import { ROUTER } from "../Routes/const";
import Home from "../Pages/Home";
import { Routes, Route } from "react-router-dom";
import Register from "../Pages/Register";
import Login from "../Pages/Login";
import MovieDetail from "../Components/MovieDetail";
import Catalog from "../Pages/Catalog";
import About from "../Pages/About";
import Pricing from "../Pages/Pricings";
import Help from "../Pages/Help";
import { MoiveProvider } from "../Contexts/movieContext";

function Routs() {
  return (
    <MoiveProvider>
      <Routes>
        <Route path={ROUTER.PATH.toString()} element={<Home />} exact />
        <Route path={ROUTER.Login.PATH.toString()} element={<Login />} />
        <Route path={ROUTER.Register.PATH.toString()} element={<Register />} />
        <Route path={ROUTER.Catalog.PATH.toString()} element={<Catalog />} />
        <Route path={ROUTER.Pricing.PATH.toString()} element={<Pricing />} />
        <Route path={ROUTER.About.PATH.toString()} element={<About />} />
        <Route path={ROUTER.Help.PATH.toString()} element={<Help />} />/
        <Route path={ROUTER.MovieDetail.PATH.toString()}element={<MovieDetail />}/>
      </Routes>
    </MoiveProvider>
  );
}

export default Routs;
