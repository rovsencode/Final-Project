import React from "react";
import "../Features/index.scss";
import Icon from "@mdi/react";
import { mdiTelevision } from "@mdi/js";
import { mdiMovie } from "@mdi/js";
import { mdiTrophy } from "@mdi/js";
import { mdiBell } from "@mdi/js";
import { mdiRocketLaunch } from "@mdi/js";
import { mdiWeb } from "@mdi/js";

function Features() {
  return (
    <section className="section section--dark">
      <div className="container">
        <div className="row">
          {/* section title */}
          <div className="col-12">
            <h2 className="section__title section__title mt-5">Our Features</h2>
            0
          </div>
          {/* end section title */}
          {/* feature */}
          <div className="col-12 col-md-6 col-lg-4">
            <div className="feature">
              {" "}
              <Icon
                className="icon feature__icon"
                path={mdiTelevision}
                size={1.5}
                color="#ff55a5"
              />
              <h3 className="feature__title">Ultra HD</h3>
              <p className="feature__text"> If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle oftext.
              </p>
            </div>
          </div>
          {/* end feature */}
          {/* feature */}
          <div className="col-12 col-md-6 col-lg-4">
            <div className="feature">
              <Icon
                path={mdiMovie}
                className="feature__icon icon"
                color="#ff55a5"
                size={1.5}
              />
              ;<h3 className="feature__title">Film</h3>
              <p className="feature__text">
                All the Lorem Ipsum generators on the Internet tend to repeat
                predefined chunks as necessary, making this the first.
              </p>
            </div>
          </div>
          {/* end feature */}
          {/* feature */}
          <div className="col-12 col-md-6 col-lg-4">
            <div className="feature">
              color="#ff55a5"
              <Icon
                className="icon feature__icon"
                color="#ff55a5"
                path={mdiTrophy}
                size={1.5}
              />
              <h3 className="feature__title">Awards</h3>
              <p className="feature__text">
                It to make a type specimen book. It has survived not only five
                centuries, but also the leap into electronic typesetting,
                remaining.
              </p>
            </div>
          </div>
          {/* end feature */}
          {/* feature */}
          <div className="col-12 col-md-6 col-lg-4">
            <div className="feature">
              <Icon
                color="#ff55a5"
                className="icon feature__icon"
                path={mdiBell}
                size={1.5}
              />
              ;<h3 className="feature__title">Notifications</h3>
              <p className="feature__text">
                Various versions have evolved over the years, sometimes by
                accident, sometimes on purpose.
              </p>
            </div>
          </div>
          {/* end feature */}
          {/* feature */}
          <div className="col-12 col-md-6 col-lg-4">
            <div className="feature">
              <i className="icon ion-ios-rocket feature__icon" />
              <Icon
                path={mdiRocketLaunch}
                size={1.5}
                className="feature__icon icon"
                color="#ff55a5"
              />
              <h3 className="feature__title">Rocket</h3>
              <p className="feature__text">
                It to make a type specimen book. It has survived not only five
                centuries, but also the leap into electronic typesetting.
              </p>
            </div>
          </div>
          {/* end feature */}
          {/* feature */}
          <div className="col-12 col-md-6 col-lg-4">
            <div className="feature">
              <Icon
                className="feature__icon icon"
                path={mdiWeb}
                color="#ff55a5"
                size={1.5}
              />
              ;<h3 className="feature__title">Multi Language Subtitles </h3>
              <p className="feature__text">
                Various versions have evolved over the years, sometimes by
                accident, sometimes on purpose.
              </p>
            </div>
          </div>
          {/* end feature */}
        </div>
      </div>
    </section>
  );
}

export default Features;
