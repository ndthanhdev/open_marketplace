import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider,
  useQuery,
  gql,
  makeVar,
} from "@apollo/client";
import { TypedTypePolicies } from "./types";

const token = makeVar<string | null>("123456");

const typePolicies: TypedTypePolicies = {
  Local: {
    fields: {
      token: {
        read() {
          return token();
        },
      },
    },
  },
};

const GraphQLClient = new ApolloClient({
  uri: "https://48p1r2roz4.sse.codesandbox.io",
  cache: new InMemoryCache({
    typePolicies,
  }),
});

export { GraphQLClient };
