import React from "react";
import "../Features/index.scss";
import Icon from "@mdi/react";
import { mdiTelevision } from "@mdi/js";
import { mdiMovie } from "@mdi/js";
import { mdiTrophy } from "@mdi/js";
import { mdiBell } from "@mdi/js";
import { mdiRocketLaunch } from "@mdi/js";
import { mdiWeb } from "@mdi/js";
import { featureService } from "../../APIs/Services/FeatureService";

function Features() {
  const icons = [
    mdiTelevision,
    mdiMovie,
    mdiTrophy,
    mdiBell,
    mdiRocketLaunch,
    mdiWeb,
  ];
  const icon = mdiWeb;
  const [features, setFeatures] = React.useState([]);
  React.useEffect(() => {
    const fetchData = async () => {
      const { data } = await featureService.getAll();
      setFeatures(data);
    };
    fetchData();
  }, []);
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
          {features.map((item, idx) => (
            <div className="col-12 col-md-6 col-lg-4">
              <div className="feature">
                <Icon
                  className="icon feature__icon"
                  path={icons[idx]}
                  size={1.5}
                  color="#ff55a5"
                />
                <h3 className="feature__title">{item.name}</h3>
                <p className="feature__text">{item.description}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

export default Features;
