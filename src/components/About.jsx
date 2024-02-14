import { useTitle } from "../hooks/useTitle";
export const About = () => {
	useTitle("About Me");
	return (
		<>
			<h1>About Page</h1>
			<p>
				My name is Ricardo Herrera. I am an ios developer and I am currently in the
				process of developing a few utilities, all of which will be available on the
				app store and fully accessible. More information will be available soon on
				my main site. You can find the code to many of my projects on github at the
				link:
				<a href="http://www.github.com/deathdogg">Github</a>
			</p>
		</>
	);
};
