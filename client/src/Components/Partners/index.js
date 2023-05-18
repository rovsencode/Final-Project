import React from "react";
import "../Partners/index.scss";
import { partnerService } from "../../APIs/Services/Partner";
function Partners() {
  const partners = [
    { imageUrl: "/img/partners/background1.png" },
    { imageUrl: "/img/partners/background2.png" },
    { imageUrl: "/img/partners/background3.png" },
    { imageUrl: "/img/partners/background4.png" },
    { imageUrl: "/img/partners/background5.png" },
    { imageUrl: "/img/partners/background6.png" },
  ];
  return (
    <section className="section">
      <div className="container">
        <div className="row">
          {/* section title */}
          <div className="col-12">
            <h2 className="section__title section__title--no-margin">
              Our Partners
            </h2>
          </div>
          {/* end section title */}
          {/* section text */}
          <div className="col-12">
            <p className="section__text section__text--last-with-margin">
              It is a long <b>established</b> fact that a reader will be
              distracted by the readable content of a page when looking at its
              layout. The point of using Lorem Ipsum is that it has a
              more-or-less normal distribution of letters, as opposed to using.
            </p>
          </div>
          {/* end section text */}
          {/* partner */}
          {partners.map(({ imageUrl }) => (
            <div className="col-6 col-sm-4 col-md-3 col-lg-2">
              <a className="partner">
                <img src={imageUrl} alt="partner" className="partner__img" />
              </a>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

export default Partners;
