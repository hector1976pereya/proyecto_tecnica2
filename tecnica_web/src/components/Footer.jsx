

import fce from "../assets/images/facebook.png";
import insta from "../assets/images/instagram.png";

const Footer=()=>{

    return(<>
              <footer class="bg-dark text-white pt-5 pb-4" id="Contactos">
        <div class="container text-center text-md-start">
            <div class="row text-center text-md-start">

                <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4 fw-bold text-primary">
                        E.E.S.T N° 2 "REPUBLICA ARGENTINA"
                    </h5>
                    <p>
                        Formamos a los técnicos del futuro. Nuestro enfoque es la práctica, la innovación y la excelencia.
                    </p>
                </div>

                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4 fw-bold">Enlaces Útiles</h5>
                    <ul class="list-unstyled">
                        <li class="pb-4"><a href="#" class="text-white-50 text-decoration-none"><img src={insta} alt=""/></a>
                        </li>
                        <li><a href="#" class="text-white-50 text-decoration-none"><img src={fce} alt=""/></a>
                        </li>

                    </ul>
                </div>

                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4 fw-bold">Contacto</h5>
                    <p><i class="fa-solid fa-home me-3"></i>C. Pedro Ignacio Rivera 3736, San Miguel, Provincia de Buenos
                        Aires</p>
                    <p><i class="fa-solid fa-envelope me-3"></i>info@tecnica2sm.edu.ar</p>
                    <p><i class="fa-solid fa-phone me-3"></i>+54 9 11 5284-2989</p>
                </div>

            </div>

            <hr class="mb-4"/>
            <div class="row align-items-center">
                <div class="col-md-7 col-lg-8">
                    <p class="mb-0 text-secondary">&copy; 2025 E.E.S.T N°2 Todos los derechos reservados. </p>
                </div>

            </div>

        </div>
    </footer>

        </>)
};

export default Footer;