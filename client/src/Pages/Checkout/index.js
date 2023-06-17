import React from "react";
import "../Checkout/index.scss";
import "../../Components/Plans/index.scss";
import { plansService } from "../../APIs/Services/PlansService";
import { Link, useNavigate, useParams } from "react-router-dom";
export default function CheckOut() {
  const { id } = useParams();
  const [plan, setPlan] = React.useState("");
  const navigate = useNavigate();
  const handleNavigate = () => {
    if (plan != "") {
      localStorage.setItem("plan", plan.id);
      console.log(plan.id);
      alert("plan is choosed");
      navigate("/plans");
    }
  };
  React.useEffect(() => {
    const fetchPlan = async () => {
      console.log(id);
      const { data } = await plansService.getId(id);
      console.log(data);
      setPlan(data);
    };
    fetchPlan();
  }, []);

  return (
    <div className="app-container">
      <div className="row">
        <div className="col" style={{ backgroundColor: "#2f2c33" }}>
          <Item plan={plan} />
        </div>
        <div className="col no-gutters">
          <Checkout props={plan} handleNavigate={handleNavigate} />
        </div>
      </div>
    </div>
  );
}

const Item = (props) => (
  <div className="item-container">
    {props.plan && (
      <div className="plan" style={{ marginTop: "20px" }}>
        <h4
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            color: "white",
          }}
        >
          {props.plan.planName}
        </h4>
        {props.plan.properties.map((property, idx) => (
          <div key={idx} className="price__item">
            <span>{property.name}</span>
          </div>
        ))}
      </div>
    )}
    <div className="item-details">
      <h2 className="item-price"> {props.plan ? props.plan.price : ""}</h2>
    </div>
  </div>
);

const Checkout = (props) => (
  <div className="checkout">
    <div className="checkout-container">
      <h3 className="heading-3">Credit card checkout</h3>
      <Input label="Cardholder's Name" type="text" name="name" />
      <Input
        label="Card Number"
        type="number"
        name="card_number"
        imgSrc="https://seeklogo.com/images/V/visa-logo-6F4057663D-seeklogo.com.png"
      />
      <div className="row">
        <div className="col">
          <Input label="Expiration Date" type="month" name="exp_date" />
        </div>
        <div className="col">
          <Input label="CVV" type="number" name="cvv" />
        </div>
      </div>

      <Button
        plan={props.plan}
        text="Apply"
        handleNavigate={props.handleNavigate}
      />
    </div>
  </div>
);

const Input = (props) => (
  <div className="input">
    <label>{props.label}</label>
    <div className="input-field">
      <input type={props.type} name={props.name} />
      <img src={props.imgSrc} />
    </div>
  </div>
);

const Button = (props) => (
  <button
    className="checkout-btn"
    onClick={() => {
      props.handleNavigate();
    }}
    type="button"
  >
    {props.text}
  </button>
);
