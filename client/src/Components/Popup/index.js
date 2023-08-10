import React from "react";
import "../Popup/index.scss";
import Icon from "@mdi/react";
import { mdiWindowClose } from "@mdi/js";
import Login from "../../Pages/Login";
import LoginPop from "../LoginPop";
function Popup({ onClose }) {
  return (
    <div className="popup">
      <div className="popup-content">
        <LoginPop onClose={onClose} />
        {/* <Login />
        <button className="close-button " onClick={onClose}>
          <Icon path={mdiWindowClose} size={1} />
        </button> */}
      </div>
    </div>
  );
}

export default Popup;
