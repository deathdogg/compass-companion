import { useTitle } from "../hooks/useTitle";
export const AppsList = () => {
	useTitle("Apps list");
	return (
		<>
			<h1>Apps list</h1>
			<h2>Compass Companion</h2>
			<h2>Drink Up</h2>
			<h2>NewEeden (beta) </h2>
		</>
	);
};
