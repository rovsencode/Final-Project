import "./App.css";
import Header from "./Components/Layout/Header";
import Footer from "./Components/Layout/Footer";

import "bootstrap/dist/css/bootstrap.min.css";
import Login from "./Pages/Login";
import Home from "./Pages/Home";
import Routs from "./Routes";
import { TokenProvider } from "./Contexts/tokenContext";

function App() {
  return (
    <>
      <TokenProvider>
        <Header />
        <Routs />
        <Footer />
      </TokenProvider>
    </>
  );
}

export default App;
