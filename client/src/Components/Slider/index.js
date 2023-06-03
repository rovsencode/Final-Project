import React, { useEffect, useState, useRef, useContext } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Carousel from "react-bootstrap/Carousel";
import image from "../Slider/split.webp";
import Icon from "@mdi/react";
import { mdiVolumeHigh } from "@mdi/js";
import { mdiVolumeOff } from "@mdi/js";
import "../Slider/index.scss";
import { movieService } from "../../APIs/Services/MovieService";
import { SplitButton } from "react-bootstrap";
import { MovieContext } from "../../Contexts/movieContext";
function Slider() {
  const videoUrls = [
    {
      name: "Split",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/Split%20Official%20Trailer%201%20(2017)%20-%20M.%20Night%20Shyamalan%20Movie.mp4",
    },
    {
      name: "BirdBox",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/Split%20Official%20Trailer%201%20(2017)%20-%20M.%20Night%20Shyamalan%20Movie.mp4",
    },
    {
      name: "1917",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/1917%20-%20Official%20Trailer%20%5BHD%5D.mp4",
    },
    {
      name: "A Quiet Place",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/A%20Quiet%20Place%20(2018)%20-%20Official%20Trailer%20-%20Paramount%20Pictures.mp4",
    },
    {
      name: "Escape Room",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/ESCAPE%20ROOM%20-%20Official%20Trailer%20(HD).mp4",
    },
    {
      name: "Extniction",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/Extinction%20Official%20Trailer%201%20(2015)%20-%20Matthew%20Fox%20Sci-Fi%20Horror%20Movie%20HD.mp4",
    },
    {
      name: "Fantasy Island",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/FANTASY%20ISLAND%20-%20Official%20Trailer%20(HD).mp4",
    },
    {
      name: "Hereditary",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/Hereditary%20_%20Official%20Trailer%20HD%20_%20A24.mp4",
    },
    {
      name: "Passengers",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/Passengers%20Official%20Trailer%201%20(2016)%20-%20Jennifer%20Lawrence%20Movie.mp4",
    },
    {
      name: "Smile",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/Smile%20_%20Official%20Trailer%20(2022%20Movie).mp4",
    },
    {
      name: "The 5th Wave",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/THE%205TH%20WAVE%20-%20Official%20Trailer%20(HD).mp4",
    },
    {
      name: "The Black Phone",
      videoUrl:
        "https://storage.cloud.google.com/my-film-trailers/Trailers/The%20Black%20Phone%20-%20Official%20Trailer.mp4",
    },
  ];
  const imageUrl = image;

  const [isLoading, setIsLoading] = React.useState(true);
  const [isVideoPlaying, setIsVideoPlaying] = React.useState(true);
  const [isMuted, setIsMuted] = React.useState(false);

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

  const [randomVideo, setRandomVideo] = useState({});
  const [movies, setMovies] = React.useState([]);
  const [randomMovie, setRandomMovie] = React.useState({});
  React.useEffect(() => {
    const randomIndex = Math.floor(Math.random() * videoUrls.length);
    setRandomVideo(videoUrls[randomIndex]);
  }, []);

  React.useEffect(() => {
    const fetchRandomMovie = async () => {
      const { data } = await movieService.getAll();
      const randomMovie = await data.find(
        (movie) => movie.name === randomVideo.name
      );
      setRandomMovie(randomMovie);
    };

    fetchRandomMovie();
  }, [randomVideo]);

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
          {randomVideo && randomVideo.videoUrl ? (
            <source src={randomVideo.videoUrl} type="video/mp4" />
          ) : null}
        </video>

        <div className={`content ${isLoading ? "hide" : ""}`}>
          {randomVideo != null ? (
            <h1 className="video-title">{randomVideo.name}</h1>
          ) : (
            ""
          )}
          {randomMovie != null ? (
            <p className="video-description">{randomMovie.description}</p>
          ) : (
            ""
          )}
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
