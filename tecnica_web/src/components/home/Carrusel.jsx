import styles from '../../assets/styles/Carrusel.module.css';
import img1 from "../../assets/images/img1.jpg";
import img2 from "../../assets/images/img2.jpg";
import img3 from "../../assets/images/img3.jpg"


const Carrusel=()=>{

    return(
        <>
    <br/>
    <hr className="m-4 w-3 "/>
    <div className="container ">
        <div className="row align-items-start ">
            <div className="col ">
                <h4 className="fw-bold" style={{color:'#055B8D'}}>Enfoque educativo</h4>
                <hr className={`my-4 ${styles.subr}`}/>
                <p className="lead ">En la EEST N°2 nos proponemos formar estudiantes íntegros, capaces de aplicar la tecnología y el conocimiento para resolver problemas reales. Impulsamos la creatividad, el trabajo en equipo y el compromiso social, 
                    con la convicción de que la educación técnica es clave para construir un futuro mejor.</p>
            </div>
            <div className="col-6 mb-5  " style={{width: "25rem"}}>
                <div   id="carouselExampleIndicators" className="carousel slide" data-bs-ride="carousel">
                    <div className="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            className="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                    </div>
                    <div className="carousel-inner">
                        <div className="carousel-item active">
                            <img src={img1} className="d-block w-100" alt="..."/>
                        </div>
                        <div className="carousel-item">
                            <img src={img2} className="d-block w-100" alt="..."/>
                        </div>
                        <div className="carousel-item">
                            <img src={img3} className="d-block w-100" alt="..."/>
                        </div>
                    </div>
                    <button className="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                        <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span className="visually-hidden">Previous</span>
                    </button>
                    <button className="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                        <span className="carousel-control-next-icon" aria-hidden="true"></span>
                        <span className="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
    
    
        </div>
    
    
    </div>

        </>
    )
};

export default Carrusel;