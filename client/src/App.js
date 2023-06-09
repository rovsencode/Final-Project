import "./App.css";
import Header from "./Components/Layout/Header";
import Footer from "./Components/Layout/Footer";
import "mdb-react-ui-kit/dist/css/mdb.min.css";
import "@fortawesome/fontawesome-free/css/all.min.css";
import "bootstrap/dist/css/bootstrap.min.css";
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
