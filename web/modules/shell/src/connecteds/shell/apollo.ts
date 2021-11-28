import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider,
  useQuery,
  gql,
  makeVar,
} from "@apollo/client";
import { TypedTypePolicies, ReadTokenQuery, ReadTokenDocument } from "./types";

const Cache = new InMemoryCache({});

const GraphQLClient = new ApolloClient({
  uri: "https://48p1r2roz4.`sse.codesandbox.io",
  cache: Cache,
});

GraphQLClient.writeQuery<ReadTokenQuery>({
  query: ReadTokenDocument,
  data: {
    local: {
      token: "123456",
    },
  },
});

setTimeout(() => {
  GraphQLClient.writeQuery<ReadTokenQuery>({
    query: ReadTokenDocument,
    data: {
      local: {
        token: "654321",
      },
    },
  });
}, 5000);

export { GraphQLClient };
