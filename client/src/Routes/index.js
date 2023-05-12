import React from 'react'
import { ROUTER } from './const'
import Home from '../Pages/Home'
import { Routes, Route} from 'react-router-dom'
import Register from '../Pages/Register'
import Login from '../Pages/Login'
import Submit from '../Components/Submit'
import Catalog from '../Pages/Catalog'

function Routs() {
  return (
      <Routes>
    
      <Route path={ROUTER.PATH.toString()}  element={<Home />}  exact />
      <Route path={ROUTER.Login.PATH.toString()} element={<Login />} />
      <Route path={ROUTER.Register.PATH.toString()} element={<Register />} />
      <Route path={ROUTER.Catalog.PATH.toString()} element={<Catalog />} />



      

      </Routes>
  )
}

export default Routs;
