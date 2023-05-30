import React, { useEffect, useRef } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Carousel from "react-bootstrap/Carousel";

function Slider() {
  const carouselRef = useRef(null);

  useEffect(() => {
    carouselRef.current?.next();
  }, []);

  return (
    <div className="home" style={{ marginTop: "100px" }}>
      <Carousel
        ref={carouselRef}
        interval={5000}
        pause={false}
        slide={true}
        className="carousel"
      >
        <Carousel.Item>
          <div className="video-container">
            <iframe
              width="1500"
              height="605"
              src="https://www.youtube.com/embed/95ghQs5AmNk?autoplay=1"
              title="YouTube video player"
              FrameBorder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowFullScreen
            ></iframe>
          </div>
        </Carousel.Item>
      </Carousel>
    </div>
  );
}

export default Slider;
