import React from 'react'
import '../Header/index.scss'
import Icon from '@mdi/react';
import { mdiMagnify } from '@mdi/js';
import { mdiLogin } from '@mdi/js';
import { mdiDotsHorizontal } from '@mdi/js';
import { useState } from 'react';
import { Link } from 'react-router-dom';




function Header() {
    const [isActiveMore, setIsActiveMore] = useState(false);

    const moreHandleClick = () => {
        setIsActiveMore(!isActiveMore);
        
    }
  return (
      <header className="header">
        <div className="header__wrap">
          <div className="container">
            <div className="row">
              <div className="col-12">
                <div className="header__content">
                  {/* header logo */}
                  <a  className="header__logo">
                    <img src="../../../img/logo.svg" alt="" />
                  </a>
                  {/* end header logo */}
                  {/* header nav */}
                  <ul className="header__nav">
                    {/* dropdown */}
                    <li className="header__nav-item">
                  <Link  className="header__nav-link"  to='/'> Home</Link>
                    </li>
                    {/* end dropdown */}
                    {/* dropdown */}
                  <li className="header__nav-item">
                    <Link className="dropdown-toggle header__nav-link" id="dropdownMenuCatalog"  to='/catalog'>Catalog</Link>
                      <ul className=" header__dropdown-menu" aria-labelledby="dropdownMenuCatalog">
                        <li><a href="catalog1.html">Catalog Grid</a></li>
                        <li><a href="catalog2.html">Catalog List</a></li>
                        <li><a href="details1.html">Details Movie</a></li>
                        <li><a href="details2.html">Details TV Series</a></li>
                      </ul>
                    </li>
                    {/* end dropdown */}
                    <li className="header__nav-item">
                    <Link  className="header__nav-link"  to='/plans'>Pricing Plans</Link>
                    </li>
                    <li className="header__nav-item">
                       <Link  className="header__nav-link"  to='/help'> Help</Link>
                    </li>
                    {/* dropdown */}
                                  <li className={isActiveMore ? "header__nav-item show" : "dropdown header__nav-item "} >
                                      <a className=" header__nav-link header__nav-link--more" onClick={moreHandleClick}  href="#" role="button" id="dropdownMenuMore" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     
<Icon path={mdiDotsHorizontal} size={1} />
   
                      </a>
                                      <ul className={isActiveMore ? " header__dropdown-menu show" : "dropdown-menu header__dropdown-menu"   } aria-labelledby="dropdownMenuMore">
                        <li><Link  style={{textDecoration:"none"}}  to='/about'>About </Link></li>
                        <li><Link style={{textDecoration:"none"}} to='/login'>Sign in</Link></li>
                      <li><Link style={{textDecoration:"none"}} to='/register'>Sign up</Link></li>
                      </ul>
                    </li>
                    {/* end dropdown */}
                  </ul>
                  {/* end header nav */}
                  {/* header auth */}
                  <div className="header__auth">
                    <button className="header-search-btn" type="button">
     
<Icon path={mdiMagnify} size={1.5} />

                    </button>
                    <a  className="header__sign-in">
                <Icon className="icon" path={mdiLogin} size={1} />
                      <span>sign in</span>
                    </a>
                  </div>
                  {/* end header auth */}
                  {/* header menu btn */}
                  <button className="header__btn" type="button">
                    <span />
                    <span />
                    <span />
                  </button>
                  {/* end header menu btn */}
                </div>
              </div>
            </div>
          </div>
        </div>
        {/* header search */}
        <form action="#" className="header__search">
          <div className="container">
            <div className="row">
              <div className="col-12">
                <div className="header__search-content">
                  <input type="text" placeholder="Search for a movie, TV Series that you are looking for" />
                  <button type="button">search</button>
                </div>
              </div>
            </div>
          </div>
        </form>
        {/* end header search */}
    </header>
    );
}
export default Header;