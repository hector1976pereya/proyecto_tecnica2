import styles from "../assets/styles/NavB.module.css";
import escudo from "../assets/icons/escudo.ico";
import fce from "../assets/images/facebook.png";
import insta from "../assets/images/instagram.png";

const NavB = () => {
  return (
    <>
      <nav
        className={`navbar navbar-expand-lg navbar-light fixed-top m ${styles.navbars}`}
      >
        <div className="container-fluid">
          <a className="navbar-brand text-light" href="#">
            <img className="" src={escudo} alt="Escudo" />
            E.E.S.T.N°2
          </a>
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav">
              <li className="nav-item">
                <a
                  className="nav-link active text-light pb-3"
                  aria-current="page"
                  href="#"
                >
                  INICIO
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link  text-light pb-3" href="#">
                  PROPUESTAS
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link text-light pb-3" href="#">
                  ATIVIDADES
                </a>
              </li>
              <li className="nav-item dropdown">
                <a
                  className="nav-link dropdown-toggle   text-light"
                  href="#"
                  id="navbarDropdownMenuLink"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  ACCESO
                </a>

                <ul
                  className="dropdown-menu"
                  aria-labelledby="navbarDropdownMenuLink"
                >
                  <li>
                    <a
                      className="dropdown-item"
                      href=" "
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      Alumnos
                    </a>
                  </li>
                  <li>
                    <a
                      className="dropdown-item"
                      href=" "
                      rel="noopener noreferrer"
                    >
                      Preceptores
                    </a>
                  </li>

                  <li>
                    <a
                      className="dropdown-item"
                      href="/app"
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      Profesores
                    </a>
                  </li>
                </ul>
              </li>
            </ul>

            <div className="container text-end">
              <img className="pe-4" src={insta} alt="Instagram" />
              <img className="pe-5" src={fce} alt="Facebook" />
            </div>
          </div>
        </div>
      </nav>
    </>
  );
};

export default NavB;
