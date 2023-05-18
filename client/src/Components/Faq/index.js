import React from "react";
import "./index.scss";
import { faqService } from "../../APIs/Services/FaqService";
function Faq() {
  const [faqs, setFaqs] = React.useState([]);
  React.useEffect(() => {
    const fetchFaq = async () => {
      const { data } = await faqService.getAll();
      setFaqs(data);
    };
    fetchFaq();
  }, []);
  return (
    <section style={{ marginTop: "50px" }} className="section">
      <div className="container">
        <div className="row">
          <div className="col-12 col-md-6">
            {faqs.map(({ name, description }) => (
              <div className="faq">
                <h3 className="faq__title">{name}</h3>
                <p className="faq__text">{description}</p>
              </div>
            ))}
          </div>
          <div className="col-12 col-md-6">
            {faqs.map(({ name, description }) => (
              <div className="faq">
                <h3 className="faq__title">{name}</h3>
                <p className="faq__text">{description}</p>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}

export default Faq;
