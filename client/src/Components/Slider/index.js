import React, { useEffect, useState, useRef } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Carousel from "react-bootstrap/Carousel";
import image from "../Slider/split.webp";
import Icon from "@mdi/react";
import { mdiVolumeHigh } from "@mdi/js";
import { mdiVolumeOff } from "@mdi/js";
import "../Slider/index.scss";

function Slider() {
  const videoUrl =
    "https://storage.cloud.google.com/my-film-trailers/Trailers/Split%20Official%20Trailer%201%20(2017)%20-%20M.%20Night%20Shyamalan%20Movie.mp4";

  const imageUrl = image;

  const [isLoading, setIsLoading] = useState(true);
  const [isVideoPlaying, setIsVideoPlaying] = useState(true);
  const [isMuted, setIsMuted] = useState(false);

  const videoRef = useRef(null);

  const handleVideoLoad = () => {
    setIsLoading(false);
  };

  const handleScroll = () => {
    const video = videoRef.current;
    if (video) {
      const videoRect = video.getBoundingClientRect();
      const windowHeight =
        window.innerHeight || document.documentElement.clientHeight;
      if (videoRect.bottom < 0 || videoRect.top > windowHeight) {
        video.pause();
      } else {
        video.play();
      }
    }
  };

  useEffect(() => {
    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  const handlePlayPause = () => {
    const video = videoRef.current;
    if (video) {
      if (video.paused) {
        video.play();
        setIsVideoPlaying(true);
      } else {
        video.pause();
        setIsVideoPlaying(false);
      }
    }
  };

  const handleMuteUnmute = () => {
    const video = videoRef.current;
    if (video) {
      if (video.muted) {
        video.muted = false;
        setIsMuted(false);
      } else {
        video.muted = true;
        setIsMuted(true);
      }
    }
  };

  return (
    <div className="home">
      <div className="video-container">
        {isLoading ? (
          <img
            src={imageUrl}
            alt="Loading"
            className="loading-image"
            style={{ width: "100%" }}
          />
        ) : null}
        <video
          className={`video-background ${isLoading ? "hide" : ""}`}
          style={{ width: "100%" }}
          autoPlay
          loop
          muted={isMuted}
          onLoadedData={handleVideoLoad}
          ref={videoRef}
        >
          <source src={videoUrl} type="video/mp4" />
        </video>

        <div className={`content ${isLoading ? "hide" : ""}`}>
          <h1 className="video-title">Split</h1>
          <p className="video-description">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed
            scelerisque malesuada enim, sed cursus tortor consequat sit amet.
            Donec id fringilla lacus. Phasellus id metus ac nibh luctus
            fermentum. Vestibulum vitae erat at mi finibus auctor. Curabitur
            dapibus, turpis et commodo finibus, elit elit efficitur justo, non
            finibus lectus dui ut turpis.
          </p>

          <button className="watch-now-button" onClick={handlePlayPause}>
            Watch Now
          </button>
          <div className="mute-button" onClick={handleMuteUnmute}>
            {isMuted ? (
              <Icon path={mdiVolumeOff} size={2} />
            ) : (
              <Icon path={mdiVolumeHigh} size={2} />
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

export default Slider;
