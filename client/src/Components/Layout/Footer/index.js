import React from "react";
import { Link } from "react-router-dom";
import "../Footer/index.scss";
import { contactService } from "../../../APIs/Services/Contact";
import { mdiFacebook } from "@mdi/js";
import { mdiInstagram } from "@mdi/js";
import { mdiWhatsapp } from "@mdi/js";
import { mdiTwitter } from "@mdi/js";
import Icon from "@mdi/react";

function Footer() {
  const socialIcons = [mdiInstagram, mdiFacebook, mdiWhatsapp, mdiTwitter];
  const [contact, setContact] = React.useState([]);
  React.useEffect(() => {
    const fetchContact = async () => {
      const { data } = await contactService.getPost();
      setContact(data);
    };
    fetchContact();

  }, []);

  return (
    <footer className="footer">
      <div className="container ">
        <div className="row d-flex justify-content-center">
          {/* footer list */}
          <div className="col-12 col-md-3">
            <h6 className="footer__title">Download Our App</h6>
            <ul className="footer__app">
              <li>
                <a href="#">
                  <img src="img/Download_on_the_App_Store_Badge.svg" alt="" />
                </a>
              </li>
              <li>
                <a href="#">
                  <img src="img/google-play-badge.png" alt="" />
                </a>
              </li>
            </ul>
          </div>
          {/* end footer list */}
          {/* footer list */}
          <div className="col-6 col-sm-4 col-md-3">
            <h6 className="footer__title">Resources</h6>
            <ul className="footer__list">
              <li>
                <a href="#">About Us</a>
              </li>
              <li>
                <a href="#">Pricing Plan</a>
              </li>
              <li>
                <a href="#">Help</a>
              </li>
            </ul>
          </div>
          {/* end footer list */}
          {/* footer list */}
          <div className="col-12 col-sm-4 col-md-3">
            <h6 className="footer__title">Contact</h6>
            <ul className="footer__list">
              <li>
                <Link to={`tel:${contact.phoneNumber}`}>
                  Phone: {contact.phoneNumber}
                </Link>
              </li>
              <li>
                <Link to={`mailto:${contact.mailAccount}`}>
                  Mail: {contact.mailAccount}
                </Link>
              </li>
            </ul>
            <ul className="footer__social">
              {socialIcons.map((icon) => (
                <li className="icon">
                  <a href="#">
                    <Icon path={icon} size={1} />
                  </a>
                </li>
              ))}
            </ul>
          </div>
          {/* end footer list */}
        </div>
      </div>
    </footer>
  );
}

export default Footer;
