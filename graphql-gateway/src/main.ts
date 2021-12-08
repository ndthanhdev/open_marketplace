import { ApolloServer } from 'apollo-server';
import { ApolloGateway } from '@apollo/gateway';
import { readFileSync } from "fs";
import Path from "path";

const supergraphSdl = readFileSync(Path.join(__dirname, './supergraph.graphql')).toString();


const gateway = new ApolloGateway({
	supergraphSdl,
});

const server = new ApolloServer({
	gateway,
});

server
	.listen()
	.then(({ url }) => {
		console.log(`🚀 Gateway ready at ${url}`);
	})
	.catch((err) => {
		console.error(err);
	});
