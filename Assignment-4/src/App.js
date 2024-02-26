import Footer from "./components/Footer";
import Header from "./components/Header";
import Mainpage from "./components/Mainpage";

function App() {
  return (
    <div className="flex flex-col justify-between h-screen">
    <Header/>
    <Mainpage/>
    <Footer/>
    </div>
  );
}

export default App;
