import React, { useState } from 'react';
import { partnerService } from '../../APIs/Services/Partner';
import Partners from '../Partners';

function Submit() {
  const [file, setFile] = useState(null);

function handleFileChange(event) {
  const file = event.target.files[0];
  const reader = new FileReader();
  reader.onloadend = () => {
    setFile(reader.result);
  };
    reader.readAsDataURL(file);
    
}


  function handleSubmit(event) {
          console.log(event.target);    
      event.preventDefault();
      const data = {
         
      title: "React",
      description: "react image upload",
      imageUrl:file,
      };
          
      console.log(data);
      console.log("success");
     partnerService.postNewPost(data)

    }
          const [partner, setPartner] = React.useState([]);
 
    const { imageUrl } = partner;
  
  React.useEffect(() => {
    console.log(partner);
  }, [partner]);


  return (
    // <>

    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor="file-upload">Dosya seçin:</label>
        <input id="file-upload" type="file" name="file" onChange={handleFileChange} />
      </div>
      <button type="submit">Yükle</button>
      </form>
    //       </>
      // <img src={imageUrl} alt="example" />
 

  );
}

export default Submit;
