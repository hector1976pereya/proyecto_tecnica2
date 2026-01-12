import React, { useEffect } from "react";
import AOS from "aos";
import "aos/dist/aos.css";
import styles from '../../assets/styles/Portada.module.css';


const Portada=()=>{

    useEffect(() => {
     AOS.init({ duration: 1500, once: true }); // "once:true" => anima solo la 1ra vez
             }, []);

    return <>
    <div className={`container-fluid ${styles.portada}` }>
          <div className={`container text-center ${styles.contenido}`} >
            <h1 data-aos="fade-down" className="fw-bold text-dark">ESCUELA TÉCNICA N°2 <br/>"República Argentina"</h1>
          </div>
          <div className=" contenido container text-center  ">
            <section  data-aos="fade-up"  className= { `${styles.citaBelgrano}`} >
              <blockquote className="text-light">
                “La educación es la base de la felicidad de los pueblos.”
              </blockquote>
              <p className= { `${styles.autor}`}>— Manuel Belgrano</p>
            </section>
          </div>
        </div>
      </>;
    
};

export default Portada;

