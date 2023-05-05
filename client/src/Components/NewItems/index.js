import { useState } from 'react';
import * as React from 'react';
import Tabs from '@mui/material/Tabs';
import Tab from '@mui/material/Tab';
import Box from '@mui/material/Box';
import Prints from '../Prints';
import '../NewItems/index.scss'
const datas = {

  newRelases: ["actrees", "films", "series"],
  series: ["la casa de papel","elite","The protect"],
  movies: ["spiderman", "split", "batman"],
  cartoons:["tom and jerry","minions"]

  
}
export default function ColorTabs() {
    const [movie,setMovie]=React.useState(null)
  const handleClick = (e) => {
 
    if (e.target.name === "series") {
      console.log("success");
      setMovie(datas.series); 
    }
        if (e.target.name === "movies") {
      console.log("success");
      setMovie(datas.movies); 
    }
         if (e.target.name === "newRelases") {
      console.log("success");
      setMovie(datas.newRelases); 
    }
         if (e.target.name === "cartoons") {
      console.log("success");
      setMovie(datas.cartoons); 
    }
    
  }
  const [value, setValue] = React.useState('one');

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  return (
    <div>
    <Box className='box' sx={{ width: '100%',display:'flex' ,justifyContent:'center' }}>
        <Tabs
          
          className='tabs'
        value={value}
        onChange={handleChange}
        textColor="secondary"
        indicatorColor="secondary"
        aria-label="secondary tabs example"
      >
        <Tab   sx={{
    color: 'white',
    textAlign: 'center',
    marginTop: '20px',
    fontSize: '1.2rem',
  }}  value="one" name="newRelases" onClick={handleClick} label="  NEW RELEASES" />
       <Tab   sx={{
    color: 'white',
    textAlign: 'center',
    marginTop: '20px',
    fontSize: '1.2rem',
  }}value="two" name="movies" onClick={handleClick}  label="MOVIES" />
        <Tab   sx={{
    color: 'white',
    textAlign: 'center',
    marginTop: '20px',
    fontSize: '1.2rem',
  }} className='tab' value="three" name="series" onClick={handleClick} label="TV SERIES" />
        <Tab   sx={{
    color: 'white',
    textAlign: 'center',
    marginTop: '20px',
    fontSize: '1.2rem',
  }} className='tab' value="four" name="cartoons" onClick={handleClick} label="CARTOONS" />

      </Tabs>
    </Box>

      {movie!=null ?  (<Prints  movie={movie}/>) : <></> }
        
    </div>
  );
}