import React, { useState, useEffect, useRef } from "react";
import axios from "axios";
import "react-responsive-carousel/lib/styles/carousel.min.css";
import { Carousel } from "react-responsive-carousel";

const VideoPLAYER = () => {
  const [videoId, setVideoId] = useState("");

  const handleSearch = async (filmName) => {
    try {
      const response = await axios.get(
        `https://www.googleapis.com/youtube/v3/search?key=AIzaSyAVam5eTk0tyPhleH4PFHJd5wb1fAEkgAs&q=${filmName}&type=video&part=snippet&maxResults=1`
      );

      const video = response.data.items[0];
      const videoId = video.id.videoId;
      setVideoId(videoId);
    } catch (error) {
      console.log("Error:", error);
    }
  };

  return (
    <div className="home" style={{ marginTop: "100px" }}>
      <input type="text" onChange={(e) => handleSearch(e.target.value)} />

      <Carousel
        autoPlay
        interval={10000}
        onChange={() => {}}
        showArrows={false}
        showIndic
        ators={false}
        showStatus={false}
        showThumbs={false}
        renderCarouselItem={(item) => <div>{item}</div>}
        selectedItem={0}
      >
        <div>
          {videoId && (
            <iframe
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowFullScreen
              title="YouTube Video"
              width="1500"
              height="605"
              //   src={`https://www.youtube.com/embed/${videoId}?autoplay=1`}
              FrameBorder="0"
            ></iframe>
          )}
        </div>
        {/* Diğer carousel öğeleri */}
      </Carousel>
    </div>
  );
};

export default VideoPLAYER;
