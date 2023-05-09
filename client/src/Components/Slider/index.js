import React from 'react';
import { useState, useEffect } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import '../Slider/index.scss'
import background from '../Slider/hero-area.png'
import Carousel from 'react-bootstrap/Carousel';





function Slider() {
	
    const  handleChange=  (index)=> {
        console.log('Slide changed to', index);
  };
   const handleClickItem=(index, item)=>{
        console.log('Item clicked', index, item);
  };
   const  handleClickThumb= (index, item)=> {
        console.log('Thumb clicked', index, item);
  };
  const [index, setIndex] = useState(0)
  useEffect(() => {
    const interval = setInterval(() => {
      setIndex((prevIndex) => (prevIndex === 2 ? 0 : prevIndex + 1));
    }, 3000);
    return () => clearInterval(interval)
  }, [])
  const handleSelect = (selectedIndex) => {
    setIndex(selectedIndex);
  };
	return (
		<div className="home" style={{
			backgroundImage: `url(${background})`,
      
			backgroundSize: 'cover',
			backgroundPosition: 'center center',
			backgroundRepeat: 'no-repeat',
		}} >
				<Carousel>
					<Carousel.Item>
						<img
							className="d-block w-100"
							src="/img/gallery/project-1.jpg"
							alt="First slide"
						/>
						<Carousel.Caption>
							<h3>First slide label</h3>
							<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
						</Carousel.Caption>
					</Carousel.Item>
					<Carousel.Item>
						<img
							className="d-block w-100"
							src="/img/gallery/project-2.jpg"
							alt="Second slide"
						/>

						<Carousel.Caption>
							<h3>Second slide label</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</Carousel.Caption>
					</Carousel.Item>
					<Carousel.Item>
						<img
							className="d-block w-100"
							src="/img/gallery/project-6.jpg"
							alt="Third slide"
						/>

						<Carousel.Caption>
							<h3>Third slide label</h3>
							<p>
								Praesent commodo cursus magna, vel scelerisque nisl consectetur.
							</p>
						</Carousel.Caption>
					</Carousel.Item>
				</Carousel>


			</div>


	);
}
export default Slider;