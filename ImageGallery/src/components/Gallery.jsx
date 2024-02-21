import React, {useEffect, useState} from 'react'

const Gallery = () => {

    const [images, setImage] = useState([]);

    useEffect(() => {

        const fetchImage = async () => {

                const apidata = await fetch("https://api.unsplash.com/photos/?client_id=5XSlcECRJb4NSXrpB8OCH8X-hP8GwkMG0MTwHq2O0NA")
                const response = await apidata.json()
                setImage(response);
           
        }

        fetchImage();
    },[])

  return (
      <div className="App">
        <div className="bg-black">
            <h1 className="text-5xl py-5 font-bold text-gray-400 text-center ">Image Gallery from unsplash API</h1>
            <div className="flex justify-center items-center m-5">
                <div className="w-full">
                    <div className="flex flex-wrap justify-evenly">
                            {images.map((image, index) => (
                                <img 
                                key={index}
                                className='m-5 w-[40%] rounded-md hover:transition duration-150 ease-in-out'
                                src={image.links.download}
                                alt={image.alt_description}
                            />
                            ))}
                    </div>
                </div>
            </div>
        </div>
    </div>
  )
}
export default Gallery;