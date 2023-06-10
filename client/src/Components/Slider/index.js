import React, { useEffect, useState, useRef, useContext } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Carousel from "react-bootstrap/Carousel";
import Icon from "@mdi/react";
import { mdiVolumeHigh } from "@mdi/js";
import { mdiVolumeOff } from "@mdi/js";
import "../Slider/index.scss";
import { movieService } from "../../APIs/Services/MovieService";
import { SplitButton } from "react-bootstrap";
import { MovieContext } from "../../Contexts/movieContext";
import { useNavigate } from "react-router-dom";
function Slider() {
  const [isLoading, setIsLoading] = React.useState(true);
  const [isVideoPlaying, setIsVideoPlaying] = React.useState(true);
  const [isMuted, setIsMuted] = React.useState(false);

  const videoRef = useRef(null);

  const handleVideoLoad = () => {
    setIsLoading(false);
  };
  const navigate = useNavigate();
  const handleNavigate = (movieId) => {
    navigate(`/movies/${movieId}`);
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

  const [randomVideo, setRandomVideo] = useState({});

  const movies = useContext(MovieContext);
  const [randomMovie, setRandomMovie] = React.useState({});
  React.useEffect(() => {
    console.log("vasvdsasddss");
    if (movies.length) {
      const randomIndex = Math.floor(Math.random() * movies.length);
      setRandomVideo(movies[randomIndex]);
    }
  }, [movies]);

  React.useEffect(() => {
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
        {isLoading && randomVideo ? (
          <img
            src={randomVideo.backgroundImage}
            alt="Loading"
            className="loading-image"
            style={{ width: "100%", height: "100%" }}
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
          {randomVideo && randomVideo.videoUrl ? (
            <source src={randomVideo.videoUrl} type="video/mp4" />
          ) : null}
        </video>

        <div className="content">
          {randomVideo != null ? (
            <h1 className="video-title">{randomVideo.name}</h1>
          ) : (
            ""
          )}
          {randomVideo != null ? (
            <p className="video-description">{randomVideo.description}</p>
          ) : (
            ""
          )}

          <button
            className="watch-now-button"
            onClick={() => handleNavigate(randomVideo.id)}
          >
            Watch Now
          </button>
          {isLoading ? (
            ""
          ) : (
            <div className="mute-button" onClick={handleMuteUnmute}>
              {isMuted ? (
                <Icon path={mdiVolumeOff} size={2} />
              ) : (
                <Icon path={mdiVolumeHigh} size={2} />
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default Slider;
