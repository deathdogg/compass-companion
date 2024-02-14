import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import { HomePage } from "./components/HomePage";
import { About } from "./components/About";
import { AppsList } from "./components/AppsList";
function App() {
	return (
		<>
			<Router>
				<nav>
					<Link to="/">Home</Link>
					<Link to="/apps">Apps</Link>
					<Link to="/about">About</Link>
				</nav>
				<Routes>
					<Route
						path="/"
						element={<HomePage />}
					/>
					<Route
						path="/apps"
						element={<AppsList />}
					/>
					<Route
						path="/about"
						element={<About />}
					/>
				</Routes>
			</Router>
		</>
	);
}

export default App;
