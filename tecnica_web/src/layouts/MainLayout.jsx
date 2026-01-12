import { Outlet } from "react-router-dom";
import Footer from "../components/Footer";
import NavB from "../components/NavB";

export default function MainLayout() {
  return (
    <>
      <NavB />
      <main>
        <Outlet />
      </main>
      <Footer/>
    </>
  );
}
