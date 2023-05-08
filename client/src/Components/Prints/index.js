import React from 'react'
import '../Prints/index.scss'
import MovieCard from '../MovieCard';
import { Grid } from '@mui/material';


function Prints() {
        
const movies = [
  {
    title: 'The Shawshank Redemption',
    description: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
    imageUrl: '/img/covers/cover4.jpg',
    action: 'Action',
    rating: '2',
    Year: '2012',
ageRestriction: '16+',
quality: 'HD',
  },
  {
    title: 'The Godfather',
    description: 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
    imageUrl: '/img/covers/cover2.jpg',
    action: 'Action',
        Year: '2010',
        rating: '5',
ageRestriction: '16+',
quality: 'HD',
  },
  {
    title: 'The Dark Knight',
    description: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    imageUrl: '/img/covers/cover3.jpg',
    action: 'Action',
        Year: '2009',
        rating: '5',
ageRestriction: '16+',
quality: 'HD',
  },
];
return (

 <Grid container spacing={2}>
    {movies.map((movie,index) => (
        <Grid item xs={12} sm={6} md={4} lg={3} key={index}>
        <MovieCard
          key={movie.title}
          title={movie.title}
          description={movie.description}
          imageUrl={movie.imageUrl}
          action={movie.action}
          rating={movie.rating}
          ageRestriction={movie.ageRestriction}
          quality={movie.quality}
          Year={movie.Year}
        />
        </Grid>
      ))}
    </Grid>


        
         

  
    );
  }


export default Prints