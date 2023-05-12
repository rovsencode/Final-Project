import React from 'react'
import Submit from '../../Components/Submit'
import '../Catalog/index.scss'
import background from '../Catalog/section.jpg'
function Catalog() {
  return (
      <>
      <section className="section catalog section--first section--bg" style={{
        backgroundImage: `url(${background})`,
      
			backgroundSize: 'cover',
			backgroundPosition: 'center center',
			backgroundRepeat: 'no-repeat',}} >
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="section__wrap"  style={{display:'flex',textAlign:'center',justifyContent:'center'}} >
                {/* section title */}
                <h2 className="section__title">Catalog</h2>
                {/* end section title */}
                {/* breadcrumb */}
                {/* <ul className="breadcrumb">
                  <li className="breadcrumb__item"><a href="#">Home</a></li>
                  <li className="breadcrumb__item breadcrumb__item--active">Catalog grid</li>
                </ul> */}
                {/* end breadcrumb */}
              </div>
            </div>
          </div>
        </div>
      </section>
 

      <div className="filter">
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="filter__content">
                <div className="filter__items">
                  {/* filter item */}
                  <div className="filter__item" id="filter__genre">
                    <span className="filter__item-label">GENRE:</span>
                    <div className="filter__item-btn dropdown-toggle" role="navigation" id="filter-genre" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <input type="button" defaultValue="Action/Adventure" />
                      <span />
                    </div>
                    <ul className="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-genre">
                      <li>Action/Adventure</li>
                      <li>Animals</li>
                      <li>Animation</li>
                      <li>Biography</li>
                      <li>Comedy</li>
                      <li>Cooking</li>
                      <li>Dance</li>
                      <li>Documentary</li>
                      <li>Drama</li>
                      <li>Education</li>
                      <li>Entertainment</li>
                      <li>Family</li>
                      <li>Fantasy</li>
                      <li>History</li>
                      <li>Horror</li>
                      <li>Independent</li>
                      <li>International</li>
                      <li>Kids</li>
                      <li>Kids &amp; Family</li>
                      <li>Medical</li>
                      <li>Military/War</li>
                      <li>Music</li>
                      <li>Musical</li>
                      <li>Mystery/Crime</li>
                      <li>Nature</li>
                      <li>Paranormal</li>
                      <li>Politics</li>
                      <li>Racing</li>
                      <li>Romance</li>
                      <li>Sci-Fi/Horror</li>
                      <li>Science</li>
                      <li>Science Fiction</li>
                      <li>Science/Nature</li>
                      <li>Spanish</li>
                      <li>Travel</li>
                      <li>Western</li>
                    </ul>
                  </div>
                  {/* end filter item */}
                  {/* filter item */}
                  <div className="filter__item" id="filter__quality">
                    <span className="filter__item-label">QUALITY:</span>
                    <div className="filter__item-btn dropdown-toggle" role="navigation" id="filter-quality" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <input type="button" defaultValue="HD 1080" />
                      <span />
                    </div>
                    <ul className="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-quality">
                      <li>HD 1080</li>
                      <li>HD 720</li>
                      <li>DVD</li>
                      <li>TS</li>
                    </ul>
                  </div>
                  {/* end filter item */}
                  {/* filter item */}
                  <div className="filter__item" id="filter__rate">
                    <span className="filter__item-label">IMBd:</span>
                    <div className="filter__item-btn dropdown-toggle" role="button" id="filter-rate" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <div className="filter__range">
                        <div id="filter__imbd-start">2.5</div>
                        <div id="filter__imbd-end">8.4</div>
                      </div>
                      <span />
                    </div>
                    <div className="filter__item-menu filter__item-menu--range dropdown-menu" aria-labelledby="filter-rate">
                      <div id="filter__imbd" />
                    </div>
                  </div>
                  {/* end filter item */}
                  {/* filter item */}
                  <div className="filter__item" id="filter__year">
                    <span className="filter__item-label">RELEASE YEAR:</span>
                    <div className="filter__item-btn dropdown-toggle" role="button" id="filter-year" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <div className="filter__range">
                        <div id="filter__years-start" >2005</div>
                        <div id="filter__years-end" >2015</div>
                      </div>
                      <span />
                    </div>
                    <div className="filter__item-menu filter__item-menu--range dropdown-menu" aria-labelledby="filter-year">
                      <div id="filter__years" />
                    </div>
                  </div>
                  {/* end filter item */}
                </div>
                {/* filter btn */}
                <button className="filter__btn" type="button">apply filter</button>
                {/* end filter btn */}
              </div>
            </div>
          </div>
        </div>
      </div>
      </>
    );
  }

export default Catalog