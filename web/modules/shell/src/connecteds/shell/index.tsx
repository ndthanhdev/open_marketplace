import React from "react";
import ReactDOM from "react-dom";
import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider,
  useQuery,
  gql,
} from "@apollo/client";
import Shell from "./shell";
import { GraphQLClient } from "./apollo";

function App() {
  return (
    <ApolloProvider client={GraphQLClient}>
      <Shell />
    </ApolloProvider>
  );
}

const MountNode = document.getElementById("mount-point");
ReactDOM.render(<App />, MountNode);
