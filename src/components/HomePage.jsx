import { useTitle } from "../hooks/useTitle";
export const HomePage = () => {
	useTitle("Home page");
	return (
		<>
			<h1>Home page</h1>
		</>
	);
};
