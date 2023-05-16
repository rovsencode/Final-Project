import React from 'react'
import { ROUTER } from '../Routes/const'
import Home from '../Pages/Home'
import { Routes, Route} from 'react-router-dom'
import Register from '../Pages/Register'
import Login from '../Pages/Login'
import Submit from '../Components/Submit'
import Catalog from '../Pages/Catalog'
import About from '../Pages/About'

function Routs() {
  return (
      <Routes>
    
      <Route path={ROUTER.PATH.toString()}  element={<Home />}  exact />
      <Route path={ROUTER.Login.PATH.toString()} element={<Login />} />
      <Route path={ROUTER.Register.PATH.toString()} element={<Register />} />
      <Route path={ROUTER.Catalog.PATH.toString()} element={<Catalog />} />
      <Route path={ROUTER.About.PATH.toString()} element={<About />} />




      

      </Routes>
  )
}

export default Routs;
