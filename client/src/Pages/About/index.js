
import React, { useState } from "react";
import { Dropdown } from 'primereact/dropdown';

//theme
import "primereact/resources/themes/lara-light-indigo/theme.css";     
    
//core
import "primereact/resources/primereact.min.css";                                       
import Submit from "../../Components/Submit";
import Rate from "../../Components/Rate";
        
export default function About() {
    const [selectedCity, setSelectedCity] = useState(null);
    const cities = [
        { name: 'New York', code: 'NY' },
        { name: 'Rome', code: 'RM' },
        { name: 'London', code: 'LDN' },
        { name: 'Istanbul', code: 'IST' },
        { name: 'Paris', code: 'PRS' }
    ];

    return (
      <>
      </>
     
      // <Submit/>
 

    )
}
        