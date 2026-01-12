import styles from '../../assets/styles/Presentacion.module.css';

const Presentacion=()=>{

    return(<>
       <br/>
        <hr  class="m-4 w-3 "/>
       <div class="container  p-3">
            <h4 className={`fw-bold  ${styles.presentacion}`}>BIENVENIDOS A LA TECNICA 2</h4>
            <hr className={`my-4" ${styles.subr} `}/>
        <p class="lead ">
            En el corazón de San Miguel, nuestra Escuela Secundaria Técnica forma jóvenes con una sólida educación académica,
            técnica y en valores. Ofrecemos una propuesta educativa orientada al desarrollo
            del pensamiento crítico, la creatividad y el compromiso con la comunidad. <br/>
            En nuestra institución, cada estudiante es preparado no solo para los desafíos
            académicos y profesionales del futuro, sino también para ser un ciudadano íntegro 
            y responsable. 
        </p>
    </div>
    <br />
    <br />
    
    </>)

};

export default Presentacion;