import React, { useContext } from "react";
import "../Header/index.scss";
import Icon from "@mdi/react";

import { mdiMagnify } from "@mdi/js";
import { mdiLogin } from "@mdi/js";
import { mdiDotsHorizontal } from "@mdi/js";
import { useState } from "react";
import { Link } from "react-router-dom";
import { movieService } from "../../../APIs/Services/MovieService";
import { accountService } from "../../../APIs/Services/AccountService";
import { TokenContext } from "../../../Contexts/tokenContext";
import ExpectedCard from "../../ExpectedCard";

function Header() {
  const [userName, setUserName] = React.useState("");
  const { token, setToken } = useContext(TokenContext);
  const [isActiveSearch, setIsActiveSearch] = React.useState(false);
  const [isActiveMore, setIsActiveMore] = React.useState(false);
  const [inputValue, setInputValue] = React.useState("");
  const [searchData, setSearchData] = React.useState([]);
  const [isOpen, setIsOpen] = useState(false);

  const toggleMenu = () => {
    setIsOpen(!isOpen);
  };
  const moreHandleClick = () => {
    setIsActiveMore(!isActiveMore);
  };
  const logOut = () => {
    accountService.clearToken();
    localStorage.removeItem("token");
    localStorage.removeItem("userName");
    setUserName();
    setToken("");
  };
  const fetchSearch = async () => {
    console.log("Searching");
    if (inputValue.length > 0) {
      const { data } = await movieService.searchFilter(inputValue);
      console.log(data);
      data.length > 0 ? setSearchData(data) : setSearchData(null);
      console.log(searchData);
    } else {
      setSearchData(null);
    }
  };
  React.useEffect(() => {
    const user = localStorage.getItem("userName");
    setUserName(user);
  }, [token]);

  const activeSearch = () => {
    setIsActiveSearch(!isActiveSearch);
    setInputValue("");
  };

  const search = (event) => {
    console.log("success");
    setInputValue(event.target.value);
    fetchSearch();
  };
  return (
    <header className="header">
      <div className="header__wrap">
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="header__content">
                {/* header logo */}
                <a className="header__logo">
                  <img src="../../../img/logo.svg" alt="" />
                </a>
                {/* end header logo */}
                {/* header nav */}
                <ul className="header__nav">
                  {/* dropdown */}
                  <li className="header__nav-item">
                    <Link className="header__nav-link" to="/">
                      {" "}
                      Home
                    </Link>
                  </li>
                  {/* end dropdown */}
                  {/* dropdown */}
                  <li className="header__nav-item">
                    <Link
                      className="dropdown-toggle header__nav-link"
                      id="dropdownMenuCatalog"
                      to="/catalog"
                    >
                      Catalog
                    </Link>
                    <ul
                      className=" header__dropdown-menu"
                      aria-labelledby="dropdownMenuCatalog"
                    >
                      <li>
                        <a href="catalog1.html">Catalog Grid</a>
                      </li>
                      <li>
                        <a href="catalog2.html">Catalog List</a>
                      </li>
                      <li>
                        <a href="details1.html">Details Movie</a>
                      </li>
                      <li>
                        <a href="details2.html">Details TV Series</a>
                      </li>
                    </ul>
                  </li>
                  {/* end dropdown */}
                  <li className="header__nav-item">
                    <Link className="header__nav-link" to="/plans">
                      Pricing Plans
                    </Link>
                  </li>
                  <li className="header__nav-item">
                    <Link className="header__nav-link" to="/help">
                      {" "}
                      Help
                    </Link>
                  </li>
                  {userName != null ? (
                    <li className="header__nav-item">
                      <Link className="header__nav-link">{userName}</Link>
                    </li>
                  ) : (
                    <li className="header__nav-item">
                      <Link className="header__nav-link" to="/help"></Link>
                    </li>
                  )}

                  {/* dropdown */}
                  <li
                    className={
                      isActiveMore
                        ? "header__nav-item show"
                        : "dropdown header__nav-item "
                    }
                  >
                    <a
                      className=" header__nav-link header__nav-link--more"
                      onClick={moreHandleClick}
                      href="#"
                      role="button"
                      id="dropdownMenuMore"
                      data-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      <Icon path={mdiDotsHorizontal} size={1} />
                    </a>
                    <ul
                      className={
                        isActiveMore
                          ? " header__dropdown-menu show"
                          : "dropdown-menu header__dropdown-menu"
                      }
                      aria-labelledby="dropdownMenuMore"
                    >
                      <li>
                        <Link style={{ textDecoration: "none" }} to="/about">
                          About{" "}
                        </Link>
                      </li>
                      {userName ? (
                        <li onClick={logOut}>
                          <Link style={{ textDecoration: "none" }} to="/login">
                            Log out
                          </Link>
                        </li>
                      ) : (
                        <li>
                          <Link style={{ textDecoration: "none" }} to="/login">
                            Login
                          </Link>
                        </li>
                      )}
                    </ul>
                  </li>
                  {/* end dropdown */}
                </ul>
                {/* end header nav */}
                {/* header auth */}
                <div className="header__auth">
                  <button
                    onClick={activeSearch}
                    className={
                      isActiveSearch
                        ? "header-search-btn active"
                        : "header-search-btn "
                    }
                    type="button"
                  >
                    <Icon path={mdiMagnify} size={1.5} />
                    {/* <Search /> */}
                  </button>
                  {userName ? (
                    <a
                      className="header__sign-in"
                      style={{ color: "white" }}
                      onClick={logOut}
                    >
                      <Link
                        style={{ textDecoration: "none", color: "white" }}
                        to="/register"
                      >
                        Log out
                      </Link>
                    </a>
                  ) : (
                    <a className="header__sign-in">
                      <Icon className="icon" path={mdiLogin} size={1} />
                      <Link to="/login" style={{ textDecoration: "none" }}>
                        <span>sign in</span>
                      </Link>
                    </a>
                  )}
                </div>
                {/* end header auth */}
                {/* header menu btn */}
                <div className="header__btn">
                  <div className="burger-menu">
                    <div
                      className={`burger-icon ${isOpen ? "open" : ""}`}
                      onClick={toggleMenu}
                    >
                      <span></span>
                      <span></span>
                      <span></span>
                    </div>
                    {isOpen && (
                      <ul
                        className="menu-items"
                        style={{ backgroundColor: "#2b2b31" }}
                      >
                        <li>
                          <Link
                            to="/"
                            style={{ textDecoration: "none", color: "white" }}
                          >
                            Home
                          </Link>
                        </li>
                        <li>
                          <Link
                            to="/catalog"
                            style={{ textDecoration: "none", color: "white" }}
                          >
                            Catalog
                          </Link>
                        </li>
                        <li>
                          <Link
                            to="/plans"
                            style={{ textDecoration: "none", color: "white" }}
                          >
                            Pricing PLans
                          </Link>
                        </li>
                        <li>
                          <Link
                            to="/help"
                            style={{ textDecoration: "none", color: "white" }}
                          >
                            Help
                          </Link>
                        </li>
                        {userName ? (
                          <li>
                            <Link
                              to="/login"
                              style={{ textDecoration: "none" }}
                              onClick={logOut}
                            >
                              Log out
                            </Link>
                          </li>
                        ) : (
                          <li>
                            <Link
                              to="/login"
                              style={{ textDecoration: "none", color: "white" }}
                            >
                              Sign in
                            </Link>
                          </li>
                        )}
                      </ul>
                    )}
                  </div>
                </div>
                {/* end header menu btn */}
              </div>
            </div>
          </div>
        </div>
      </div>
      {/* header search */}
      <form
        action="#"
        className={
          isActiveSearch
            ? " header__search header__search--active"
            : " header__search "
        }
      >
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="header__search-content">
                <input
                  onChange={search}
                  onBlur={(event) => {
                    setInputValue(event.target.value);
                    fetchSearch();
                  }}
                  value={inputValue}
                  type="text"
                  placeholder="Search for a movie, TV Series that you are looking for"
                />

                <button type="button">search</button>
              </div>
              <ul
                style={{
                  listStyle: "none",
                  padding: 0,
                  margin: 0,
                }}
              >
                {
                  searchData && inputValue && isActiveSearch ? (
                    searchData.map((movie) => (
                      <div style={{ width: "400px" }}>
                        <li
                          style={{
                            width: "50%",
                            color: "white",
                            backgroundColor: "#28282d",
                            fontSize: "16px",
                          }}
                        >
                          <ExpectedCard
                            name={movie.name}
                            imageUrl={movie.imageUrl}
                          />
                        </li>
                      </div>
                    ))
                  ) : inputValue.length < 2 && inputValue.length > 0 ? (
                    <li
                      style={{
                        color: "white",
                        backgroundColor: "#28282d",
                        fontSize: "16px",
                      }}
                    >
                      En azi 2 herf daxil edin
                    </li>
                  ) : null
                  //     (
                  //   <li
                  //     className={
                  //       isActiveSearch && inputValue ? "content" : "d-none"
                  //     }
                  //     style={{
                  //       color: "white",
                  //       backgroundColor: "#28282d",
                  //       fontSize: "16px",
                  //     }}
                  //   >
                  //     it is not found film
                  //   </li>
                  // )
                }
              </ul>
            </div>
          </div>
        </div>
      </form>

      {/* end header search */}
    </header>
  );
}
export default Header;
