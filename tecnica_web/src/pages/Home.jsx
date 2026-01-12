import Actividades from "../components/home/Actividades";
import Carrusel from "../components/home/Carrusel";
import Orientacion from "../components/home/Orientación";
import Portada from "../components/home/Portada";
import Presentacion from "../components/home/Presentacion";



const Home = () => {
  return (
  <>
  <Portada/>
  <Presentacion/>
  <Orientacion/>
  <Actividades/>
  <Carrusel/>
  </>  
  );
};

export default Home;