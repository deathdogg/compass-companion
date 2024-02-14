import { useTitle } from "../hooks/useTitle";
export const HomePage = () => {
	useTitle("Home - Compass Companion");
	return (
		<>
			<h1>Home</h1>
			<p>
				Wellcome to the compass companion app site. Compass Companion is an iOS app
				to help you log certain aspects of your guide dog.
			</p>
			<h2>Features</h2>
			<p>Some of the features include:</p>
			<ul>
				<li>
					<p>Track your dog&apos;s waterings and feedings</p>
				</li>
				<li>
					<p>Log medications</p>
				</li>
				<li>
					<p>Record vet visits</p>
				</li>
				<li>
					<p>Keep track of your dog&apos;s weight</p>
				</li>
				<li>
					<p>
						Be reminded to take your dog out after having water afew a predetermined
						amount of time
					</p>
				</li>
			</ul>
			<h2>Download the App</h2>
			<p>
				The app is currently in the process of being reviewed by Apple&apos;s
				testflight team. Please check back for updates.
			</p>
		</>
	);
};
