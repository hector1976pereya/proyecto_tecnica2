

import styles from "../../assets/styles/Orientacion.module.css";
import basico from "../../assets/images/basico.jpeg";
import construcciones from "../../assets/images/Construcciones.jpg";
import informatica from "../../assets/images/Informatica.jpeg";
import React, { useEffect } from "react";
import AOS from "aos";
import "aos/dist/aos.css";

 const Orientacion=()=>{

    useEffect(() => {
         AOS.init({ duration: 1000, once: false }); // "once:true" => anima solo la 1ra vez
                 }, []);


    return(<>
    <div className= {`container ${styles.conCard}`}>
    
        <div className="row align-items-center ">
            <div className="col">
                <div data-aos="flip-up"className={`card mx-auto rounded-3 border-1 Small shadow mt-4 mb-4 ${styles.tarjetas}`} >
                    <img src={basico} className="card-img-top" alt="..."/>
                    <div className="card-body" >
                        <h5>Ciclo básico</h5>
                        <h5>Período común</h5>
                       <button className={` ${styles.btnColor}`}>Conocer más</button>
                    </div>
                </div>
            </div>
            <div className="col">
                <div data-aos="flip-up" className= {`card mx-auto rounded-3 border-1 Small shadow mt-4 mb-4 ${styles.tarjetas}`}>
                    <img src={construcciones} className="card-img-top" alt="..."/>
                    <div className="card-body">
                        <h5>Ciclo superior</h5>
                        <h5>Maestro Mayor de obra</h5>
                        <button 
                        className={` ${styles.btnColor}`}
                        
                        
                        >Conocer más</button>
                    </div>
                </div>
            </div>
            <div className="col">
                <div data-aos="flip-up" className={`card mx-auto rounded-3 border-1 Small shadow mt-4 mb-4 ${styles.tarjetas}`}>
                    <img src={informatica} className="card-img-top" alt="..."/>
                    <div className="card-body">
                        <h5>Ciclo superior</h5>
                        <h5>Informática</h5>
                        <button className={`${styles.btnColor}`}>Conocer más</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br />
    <br />
    
    </> 
        )
};

export default Orientacion;