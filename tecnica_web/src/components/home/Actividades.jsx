import styles from "../../assets/styles/Actividades.module.css";
import logros from "../../assets/images/logro.png";
import feria from "../../assets/images/feria-de-ciencias.png";
import expo from "../../assets/images/expo.png";
import competencia from "../../assets/images/competencia.png";

    const Actividades=()=>{

    return(<>
        <hr  className="m-4 w-3 "/>
 
    <div className="container p-5">
    
        <h4 className="fw-bold" style={{color:'#055B8D'}}>Mirá todas nuestras actividades</h4>
        <hr className= {`my-4 ${styles.subr}`} />
        <p className="lead">A través de distintas actividades, los estudiantes tienen la oportunidad de investigar, crear, compartir y superarse. 
            Desde clubes y exposiciones hasta competencias y logros destacados, cada propuesta busca impulsar 
            la curiosidad, el trabajo en equipo y el espíritu innovador de todos.</p>
        <div className="row">
            <div className="col">
                <div data-aos="zoom-in-up"
                    className={`card mx-auto text-white bg-primary mb-3 rounded-pill shadow border-5 text-center ${styles.cards}`}
                  >
    
                    <div className="card-body ">
                        <h5 className=" actividades card-title ">Club de ciencias</h5>
                        <img src={feria} alt=""/>
                    </div>
                </div>
    
            </div>
            <div className="col">
                <div data-aos="zoom-in-up" className={`card mx-auto text-white bg-primary mb-3 rounded-pill shadow border-5 text-center ${styles.cards}`} >
    
                    <div className="card-body text-center">
                        <h5 className=" actividades card-title">Exposiciones</h5>
                        <img src={expo} alt=""/>
                    </div>
                </div>
    
    
            </div>
            <div className="col">
                <div data-aos="zoom-in-up" className={`card mx-auto text-white bg-primary mb-3 rounded-pill shadow border-5 text-center ${styles.cards}`} >
                   
                    <div className="card-body text-center">
                        <h5 className=" actividades card-title">Competencias</h5>
                        <img src={competencia} alt=""/>
    
                    </div>
                </div>
    
            </div>
            <div className="col">
                   <div data-aos="zoom-in-up" className={`card mx-auto text-white bg-primary mb-3 rounded-pill shadow border-5 text-center ${styles.cards}`} >
                        <div className="card-body text-center">
                        <h5 className=" actividades card-title">Logros</h5>
                        <img src={logros} alt=""/>
                    </div>
                </div>
    
            </div>
        </div>
    </div>

    </>)
};

export default Actividades;