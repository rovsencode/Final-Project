import React from "react";
import "./index.scss";
import { plansService } from "../../APIs/Services/PlansService";
import { propertyService } from "../../APIs/Services/PropertiesService";
import MovieForm from "../MovieForm";

export default function Plans() {
  const [plans, setPLans] = React.useState([]);
  const [properties, setProperty] = React.useState([]);
  React.useState(() => {
    const fetchPlans = async () => {
      const { data } = await plansService.getAll();
      setPLans(data);
    };

    fetchPlans();
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
                    {item.price}$
                  </div>
                  {item.properties.map((property) => (
                    <div className="price__item">
                      <span>{property.name}</span>
                    </div>
                  ))}
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
    // <>
    //   {/* <MovieForm /> */}
    // </>
  );
}
