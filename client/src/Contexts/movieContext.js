import React, { createContext } from "react";
import { movieService } from "../APIs/Services/MovieService";

export const MovieContext = createContext();

export const MoiveProvider = ({ children }) => {
  const [movies, setMovies] = React.useState([]);

  React.useEffect(() => {
    const fetchMovies = async () => {
      const { data } = await movieService.getAll();
      setMovies(data);
    };
    fetchMovies();
  }, []);

  return (
    <MovieContext.Provider value={movies}>{children}</MovieContext.Provider>
  );
};
