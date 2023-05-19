import React from "react";
import "./index.scss";
import { plansService } from "../../APIs/Services/PlansService";
import { propertyService } from "../../APIs/Services/PropertiesService";

export default function Plans() {
  const [plans, setPLan] = React.useState([]);
  const [properties, setProperty] = React.useState([]);
  React.useState(() => {
    const fetchPlan = async () => {
      const { data } = await plansService.getAll();
      setPLan(data.$values);

      // const info = data.$values;
      // console.log(info);
    };

    const fetchProperty = async () => {
      const { data } = await propertyService.getAll();
      setProperty(data);
    };
    fetchPlan();
    // fetchProperty();
  }, []);
  return (
    <>
      <div className="section">
        <div className="container">
          <div className="row">
            {/* price */}
            {plans.map((item) => (
              <div className="col-12 col-md-6 col-lg-4">
                <div className="price">
                  <div className="price__item price__item--first">
                    <span>{item.planName}</span>
                    {item.price} <span>$</span>
                  </div>
                  <div className="price__item">
                    <span>7 days</span>
                  </div>
                  <div className="price__item">
                    <span>720p Resolution</span>
                  </div>
                  <div className="price__item">
                    <span>Limited Availability</span>
                  </div>
                  <div className="price__item">
                    <span>Desktop Only</span>
                  </div>
                  <div className="price__item">
                    <span>Limited Support</span>
                  </div>
                  <a href="#" className="price__btn">
                    Choose Plan
                  </a>
                </div>
              </div>
            ))}
            {/* end price */}
          </div>
        </div>
      </div>
    </>
  );
}
