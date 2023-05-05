import './App.css';
import Header from './Components/Layout/Header';
import Footer from './Components/Layout/Footer';

// import {Routes} from 'react-router-dom'
import "bootstrap/dist/css/bootstrap.min.css";
import Login from './Pages/Login';
import Home from './Pages/Home';
import Routs from './Routes';
function App() {
  return (
    <>
      <Header />
       <Routs/>
      <Footer />
   </>

  


  )
}

export default App;
