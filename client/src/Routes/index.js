import React from "react";
import { ROUTER } from "../Routes/const";
import Home from "../Pages/Home";
import { Routes, Route, useNavigate } from "react-router-dom";
import Register from "../Pages/Register";
import Login from "../Pages/Login";
import MovieDetail from "../Components/MovieDetail";
import Catalog from "../Pages/Catalog";
import Pricing from "../Pages/Pricings";
import Help from "../Pages/Help";
import { MoiveProvider } from "../Contexts/movieContext";
import ForgetPassword from "../Components/Authorization/ForgetPassword";
import ResetPassword from "../Components/Authorization/ResetPassoword";
import Checkout from "../Pages/Checkout";

function Routs() {
  const navigate = useNavigate();
  const token = localStorage.getItem("token");

  // if (!token) {
  // return (
  //   <Routes>
  //     <Route path={ROUTER.Register.PATH.toString()} element={<Register />} />
  //     <Route path={ROUTER.Login.PATH.toString()} element={<Login />} />
  //     <Route path="*" element={<Login />} />
  //   </Routes>
  // );
  // }
  return (
    <MoiveProvider>
      <Routes>
        <Route path={ROUTER.PATH.toString()} element={<Home />} exact />
        <Route path={ROUTER.Register.PATH.toString()} element={<Register />} />
        <Route path={ROUTER.Help.PATH.toString()} element={<Help />} />

        <Route path={ROUTER.Login.PATH.toString()} element={<Login />} />
        <Route path={ROUTER.Catalog.PATH.toString()} element={<Catalog />} />
        <Route path={ROUTER.Pricing.PATH.toString()} element={<Pricing />} />

        <Route
          path={ROUTER.ForgetPassword.PATH.toString()}
          element={<ForgetPassword />}
        />
        <Route
          path={ROUTER.ResetPassword.PATH.toString()}
          element={<ResetPassword />}
        />
        <Route
          path={ROUTER.MovieDetail.PATH.toString()}
          element={<MovieDetail />}
        />
        <Route path={ROUTER.CheckOut.PATH.toString()} element={<Checkout />} />
        <Route path="*" element={<Home />} />
      </Routes>
    </MoiveProvider>
  );
}

export default Routs;
