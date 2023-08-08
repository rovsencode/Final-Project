import React from "react";
import "../Popup/index.scss";
import Login from "../../Pages/Login";
function Popup({ onClose }) {
  return (
    <div className="popup">
      <div className="popup-content">
        <Login />
        <button className="close-button " onClick={onClose}>
          close
        </button>
      </div>
    </div>
  );
}

export default Popup;
